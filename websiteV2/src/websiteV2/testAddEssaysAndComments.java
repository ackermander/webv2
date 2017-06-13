package websiteV2;

import java.util.Date;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import ce.acmd.things.clazz.Comment;
import ce.acmd.things.clazz.Essay;

public class testAddEssaysAndComments {
	public static void main(String[] args) {
		// 创建一个SessionFactory
				SessionFactory sessionFactory = null;
				// 创建Configuration对象:对应hibernate的基本配置信息和对象关系映射
				Configuration configuration = new Configuration().configure();
				// 创建一个ServiceRegistry对象:hibernate 4.x后新添加的对象
				// hibernate 的任何配置和服务都需要在该对象中注册后才能有效
				ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
						.configure().build();

				sessionFactory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
				// 创建一个Session对象
				Session session = sessionFactory.openSession();
				// 开启事务
				Transaction transaction = session.beginTransaction();
				// 执行保存操作

//				Comment comment = new Comment();
//				Comment comment3 = new Comment();
// 				Essay essay = new Essay();
//				
// 				comment.setAuthor("somebody");
// 				comment.setCommentContent("something");
// 				comment.setDate(new java.sql.Date(new Date().getTime()));
// 				comment.setTargetEssay(essay);
// 				comment3.setAuthor("somebody1");
// 				comment3.setCommentContent("something");
// 				comment3.setDate(new java.sql.Date(new Date().getTime()));
// 				comment3.setTargetEssay(essay);
//				
//				essay.setAuthor("acmd");
//				essay.setContent("something");
//				essay.setDate(new java.sql.Date(new Date().getTime()));
//				essay.setHeader("a header");
//				comment.setTargetEssay(essay);
//				essay.getComments().add(comment);
//				essay.getComments().add(comment3);
//				
//				session.save(essay);
//				session.save(comment);
//				session.save(comment3);
//				
//				
				Essay essay = session.get(Essay.class, 1);
				System.out.println(essay.geteOwner());
				// 提交事务
				transaction.commit();
				// 关闭Session
				session.close();
				// 关闭SessionFactory对象
				sessionFactory.close();
	}
}
