package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Dto.MemberDto;

public class MemberDao {
   
   private Connection con;
   private PreparedStatement pstmt;
   private ResultSet rs;

   public MemberDao() {
      try {
         Class.forName("oracle.jdbc.OracleDriver");
         con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   //SELECTALL
   public List<MemberDto> SelectAll(){
      
      List<MemberDto> list = new ArrayList();
      MemberDto dto = null;
      try {
         String sql = "select m_no,m_name,member.p_code,p_school,m_jumin,m_city,p_tel1||'-'||p_tel2||'-'||p_tel3 as tel\r\n"
               + "from tbl_member_202005 member\r\n"
               + "inner join tbl_party_202005 party\r\n"
               + "on member.p_code = party.p_code";
         pstmt=con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         if(rs != null)
         {
            while(rs.next())
            {
               dto = new MemberDto();
               dto.setM_no(rs.getString("m_no"));
               dto.setM_name(rs.getString("m_name"));
               dto.setP_code(rs.getString("p_code"));
               dto.setP_school(rs.getString("p_school"));
               dto.setM_jumin(rs.getString("m_jumin"));
               dto.setM_city(rs.getString("m_city"));
               dto.setP_tel(rs.getString("tel"));
               list.add(dto);
            }
         }
      }catch(Exception e) {
         
      }finally {
         try {rs.close();}catch(Exception e) {}
         try {pstmt.close();}catch(Exception e) {}
         try {con.close();}catch(Exception e) {}
      }
      return list;
   }
   
   
//   public static void main(String[] args) {
//      MemberDao dao = new MemberDao();
//      List<MemberDto> list = dao.SelectAll();
//      
//      for(MemberDto dto : list) {
//         System.out.println(dto);
//      }
//   }
   
   
   
}