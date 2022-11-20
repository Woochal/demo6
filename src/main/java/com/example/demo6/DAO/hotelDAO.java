package com.example.demo6.DAO;

import com.example.demo6.bean.hotelVO;
import com.example.demo6.util.JDBCUtil;

import java.lang.reflect.Member;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class hotelDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String hotel_INSERT = "insert into hotel (Name, Phone, RoomNum, Guests, CheckIn, CheckOut, Payment/*, photo*/) values (?,?,?,?,?,?,?/*,?*/)";
	private final String hotel_UPDATE = "update hotel set Name=?, Phone=?, RoomNum=?, Guests=?, CheckIn=?, CheckOut=?, Payment=? where Id=?";
	private final String hotel_DELETE = "delete from hotel  where Id=?";
	private final String hotel_GET = "select * from hotel  where Id=?";
	private final String hotel_LIST = "select * from hotel order by Id desc";

	public int insertHotel(hotelVO vo) {
		System.out.println("===> JDBC로 inserthotel() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(hotel_INSERT);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getPhone());
			stmt.setString(3, vo.getRoomNum());
			stmt.setString(4, vo.getGuests());
			stmt.setString(5, vo.getCheckIn());
			stmt.setString(6, vo.getCheckOut());
			stmt.setString(7, vo.getPayment());
//			stmt.setString(8, vo.getPhoto());
			stmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteHotel(hotelVO vo) {
		System.out.println("===> JDBC로 deletehotel() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(hotel_DELETE);
			stmt.setInt(1, vo.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int updateHotel(hotelVO vo) {
		System.out.println("===> JDBC로 updatehotel() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(hotel_UPDATE);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getPhone());
			stmt.setString(3, vo.getRoomNum());
			stmt.setString(4, vo.getGuests());
			stmt.setString(5, vo.getCheckIn());
			stmt.setString(6, vo.getCheckOut());
			stmt.setString(7, vo.getPayment());
			stmt.setInt(8, vo.getId());
			
			
			System.out.println(vo.getName() + "-" + vo.getPhone() + "-" + vo.getRoomNum() + "-" + vo.getGuests() + "-" + vo.getCheckIn() + "-" + vo.getCheckOut() + "-" + vo.getPayment() + "-" + vo.getId());
			stmt.executeUpdate();
			return 1;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public hotelVO getHotel(int Id) {
		hotelVO one = new hotelVO();
		System.out.println("===> JDBC로 gethotel() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(hotel_GET);
			stmt.setInt(1, Id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setId(rs.getInt("Id"));
				one.setName(rs.getString("Name"));
				one.setPhone(rs.getString("Phone"));
				one.setRoomNum(rs.getString("RoomNum"));
				one.setGuests(rs.getString("Guests"));
				one.setCheckIn(rs.getString("CheckIn"));
				one.setCheckOut(rs.getString("CheckOut"));
				one.setPayment(rs.getString("Payment"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<hotelVO> getHotelList(){
		List<hotelVO> list = new ArrayList<hotelVO>();
		System.out.println("===> JDBC로 gethotelList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(hotel_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				hotelVO one = new hotelVO();
				one.setId(rs.getInt("Id"));
				one.setName(rs.getString("Name"));
				one.setPhone(rs.getString("Phone"));
				one.setRoomNum(rs.getString("RoomNum"));
				one.setGuests(rs.getString("Guests"));
				one.setCheckIn(rs.getString("CheckIn"));
				one.setCheckOut(rs.getString("CheckOut"));
				one.setPayment(rs.getString("Payment"));
				list.add(one);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}


	public String getPhotoFilename(int Id) {
		String filename = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(hotel_GET);
			stmt.setInt(1, Id);
			rs = stmt.executeQuery();
			if(rs.next()){
				filename = rs.getString("photo");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
		return filename;
	}


}
