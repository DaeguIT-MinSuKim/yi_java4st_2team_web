package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rentcar.dao.MemberDao;
import rentcar.dto.Member;
import rentcar.exception.CustomSQLException;

public class MemberDaoImpl implements MemberDao {

	private static final MemberDaoImpl instance = new MemberDaoImpl();
	private Connection con;

	public MemberDaoImpl() {
		super();
	}

	public static MemberDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public ArrayList<Member> selectMemberByAll() {
		String sql = "SELECT * FROM MEMBER ORDER BY NAME ASC";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				ArrayList<Member> list = new ArrayList<Member>();
				do {
					list.add(getMemberList(rs));
				} while (rs.next());
				return list;
			}

		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private Member getMemberList(ResultSet rs) throws SQLException {
		String id = rs.getString("ID");
		String pwd = rs.getString("PWD");
		String name = rs.getString("NAME");
		String tel = rs.getString("TEL");
		String license = rs.getString("LICENSE");
		String email = rs.getString("EMAIL");
		String is_black = rs.getString("IS_BLACK");
		String address = rs.getString("ADDRESS");
		String remark = rs.getString("REMARK");
		Integer count = rs.getInt("COUNT");
		String event = rs.getString("EVENT");
		return new Member(id, pwd, name, tel, license, email, is_black, address, remark, count, event);
	}

	@Override
	public Member selectMemberByUserId(Member member) {
		String sql = "SELECT * FROM MEMBER WHERE id = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getId());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getMemberList(rs);
				}

			}

		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int insertMember(Member member) {
		String sql = "INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, ADDRESS) VALUES (?, ?, ?, ?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getTel());
			pstmt.setString(5, member.getLicense());
			pstmt.setString(6, member.getAddress());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public int updateMember(Member member) {
		String sql = "UPDATE MEMBER SET PWD=?, NAME=?, TEL=?, LICENSE=?, ADDRESS=? WHERE ID=?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getPwd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getTel());
			pstmt.setString(4, member.getLicense());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public int deleteMember(Member member) {
		String sql = "DELETE FROM MEMBER WHERE ID = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

}
