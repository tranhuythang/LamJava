package Ex1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Ex1 {
	public static void main(String[] args) {
		String query1 = " select Articles.articleID, title, count(commentID) as 'comment_count'"
					 +  " from Articles"
					 +  " inner join Comments on Articles.articleID = Comments.articleID"
					 +  " group by Articles.articleID, title ";

		String query2 = " select Articles.articleID, title, count(commentID) as 'comment count'"
					  + " from Articles"
					  + " inner join Comments on Articles.articleID = Comments.articleID"
					  + " group by Articles.articleID, title"
					  + " having count(commentID) > 2";

		
		String connectionString = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=NewsPaper;Trusted_Connection=True;user=userTest;password=Abc8357322";
//		String connectionString = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=NewsPaper;user=userWithoutLogin";
		
		
		try(
			Connection connection = DriverManager.getConnection(connectionString);
			Statement statement1 = connection.createStatement();
			Statement statement2 = connection.createStatement();
			ResultSet result1 = statement1.executeQuery(query1);
			ResultSet result2 = statement2.executeQuery(query2);
				){
			System.out.println("\nQuesion 1: List of articles:comment");
			while(result1.next()) {
				System.out.println(result1.getString("title") + ":" + result1.getString("comment_count"));
			}
			System.out.println("\nQuesion 2: List of articles:comment > 2");
			while(result2.next()) {
				System.out.println(result2.getString("title") + ":" + result2.getString("comment count"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}