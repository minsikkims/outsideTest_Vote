package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Dto.VoteDto;

public class VoteDao {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public VoteDao() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// INSERT
	public boolean Insert(VoteDto dto) {
		boolean isok = false;
		try {
			pstmt = con.prepareStatement("insert into tbl_vote_202005 values(?,?,?,?,?,?)");
			pstmt.setString(1, dto.getV_jumin());
			pstmt.setString(2, dto.getV_name());
			pstmt.setString(3, dto.getM_no());
			pstmt.setString(4, dto.getV_time());
			pstmt.setString(5, dto.getV_area());
			pstmt.setString(6, dto.getV_confirm());
			int result = pstmt.executeUpdate();
			if (result > 0)
				isok = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception e) {
			}
			try {
				con.close();
			} catch (Exception e) {
			}
		}

		return false;
	}

	// SELECTALL
	public List<VoteDto> SelectAll() {
		List<VoteDto> list = new ArrayList();
		VoteDto dto = null;

		try {
			pstmt = con.prepareStatement("select * from tbl_vote_202005 where v_area='제1투표소'");
			rs = pstmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					dto = new VoteDto();
					dto.setM_no(rs.getString("m_no"));
					dto.setV_area(rs.getString("v_area"));
					dto.setV_confirm(rs.getString("v_confirm"));
					dto.setV_jumin(rs.getString("v_jumin"));
					dto.setV_name(rs.getString("v_name"));
					dto.setV_time(rs.getString("v_time"));
					list.add(dto);
				}
			}

		} catch (Exception e) {

		} finally {
			try {
				rs.close();
			} catch (Exception e) {
			}
			try {
				pstmt.close();
			} catch (Exception e) {
			}
			try {
				con.close();
			} catch (Exception e) {
			}
		}

		return list;
	}

}
