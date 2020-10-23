package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import rentcar.dao.MemberDao;
import rentcar.dto.Member;
import rentcar.exception.CustomSQLException;
import rentcar.utils.Paging;

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
		String gender = rs.getString("GENDER");
		Date birth = rs.getTimestamp("BIRTH");
		String name = rs.getString("NAME");
		String tel = rs.getString("TEL");
		String li_class = rs.getString("LI_CLASS");
		String li_number = rs.getString("LI_NUMBER");
		String email = rs.getString("EMAIL");
		String address = rs.getString("ADDRESS");
		String is_black = rs.getString("IS_BLACK");
		Integer counting = rs.getInt("COUNTING");
		Date date = rs.getTimestamp("LOGIN_DATE");
		Integer try_counting = rs.getInt("TRY_COUNTING");
		String is_lock = rs.getString("IS_LOCK");
		Integer lock_counting = rs.getInt("LOCK_COUNTING");
		return new Member(id, pwd, gender, birth, name, tel, li_class, li_number, email, address, is_black, counting,
				date, try_counting, is_lock, lock_counting);
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
		String sql = "INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getGender());
			pstmt.setTimestamp(4, new Timestamp(member.getBirth().getTime()));
			pstmt.setString(5, member.getName());
			pstmt.setString(6, member.getTel());
			pstmt.setString(7, member.getLi_class());
			pstmt.setString(8, member.getLi_number());
			pstmt.setString(9, member.getEmail());
			pstmt.setString(10, member.getAddress());
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
			pstmt.setString(2, member.getGender());
			pstmt.setTimestamp(3, new Timestamp(member.getBirth().getTime()));
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getTel());
			pstmt.setString(6, member.getLi_class());
			pstmt.setString(7, member.getLi_number());
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getAddress());
			pstmt.setString(10, member.getId());
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

	// 페이징
	@Override
	public int countMemberByAll() {
		String sql = "SELECT COUNT(*) FROM MEMBER";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return 0;
	}

	@Override
	public ArrayList<Member> pagingMemberByAll(Paging paging) {
		String sql = "SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM MEMBER ORDER BY NAME ASC) a) WHERE RN BETWEEN ? AND ? ORDER BY RN";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, paging.getStart());
			pstmt.setInt(2, paging.getEnd());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					ArrayList<Member> list = new ArrayList<Member>();
					do {
						list.add(getMemberList(rs));
					} while (rs.next());
					return list;
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

}
