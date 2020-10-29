package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.BrandDao;
import rentcar.dto.Brand;
import rentcar.dto.Kind;
import rentcar.exception.CustomSQLException;

public class BrandDaoImpl implements BrandDao {
	private static final BrandDaoImpl instance = new BrandDaoImpl();
	private Connection con;

	public BrandDaoImpl() {
		super();
	}

	public static BrandDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}
	
	private Brand getBrand(ResultSet rs) throws SQLException {
		Brand b = new Brand();
		b.setCode(rs.getInt("BRAND_CODE"));
		b.setName(rs.getString("BRAND_NAME"));
		b.setImage(rs.getString("BRAND_IMAGE"));
		
		return b;
	}
	
	@Override
	public List<Brand> selectBrandByAll() {
		String sql = "SELECT * FROM BRAND";
		try(PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				List<Brand> list = new ArrayList<Brand>();
				do {
					list.add(getBrand(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public Brand selectBrandByNo(int res) {
		String sql = "SELECT * FROM BRAND WHERE BRAND_CODE = ?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, res);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getBrand(rs);
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return null;
	}

	@Override
	public int insertBrand(Brand brand) {
		String sql = "INSERT INTO BRAND(BRAND_NAME, BRAND_IMAGE) VALUES (?, ?)";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, brand.getName());
			pstmt.setString(2, brand.getImage());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateBrand(Brand brand) {
		String sql = "UPDATE BRAND SET BRAND_NAME = ?, BRAND_IMAGE = ? WHERE BRAND_CODE = ?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, brand.getName());
			pstmt.setString(2, brand.getImage());
			pstmt.setInt(3, brand.getCode());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int deleteBrand(Brand brand) {
		deleteBrandByCar(brand);
		//브랜드 삭제
		String sql = "DELETE FROM BRAND WHERE BRAND_CODE = ?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, brand.getCode());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	//차량과 연관된 브랜드 삭제
		private int deleteBrandByCar(Brand brand) {
			String sql = "UPDATE CAR SET BRAND_CODE = NULL WHERE BRAND_CODE = ?";
			try (PreparedStatement pstmt = con.prepareStatement(sql)) {
				pstmt.setInt(1, brand.getCode());
				return pstmt.executeUpdate();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
}
