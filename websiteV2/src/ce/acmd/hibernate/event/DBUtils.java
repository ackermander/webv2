package ce.acmd.hibernate.event;

import java.sql.Date;
import java.util.List;

import org.apache.commons.lang3.ObjectUtils.Null;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.sun.org.apache.bcel.internal.generic.NEW;

import ce.acmd.things.clazz.Account;
import ce.acmd.things.clazz.Comment;
import ce.acmd.things.clazz.Essay;
import ce.acmd.things.clazz.simple.account.SimpleAccount;

public class DBUtils {
	
	public final static String NO_ACCOUNT_IN_DATABASE = "no_account_in_database";
	public final static String AN_ACCOUNT_IN_DATABASE = "an_account_in_database";
	public final static String AN_ACCOUNT_INSERT_SUCCESS = "an_account_insert_success";
	
	public static Object insert(Object obj){
		
		SessionFactory sessionFactory = null;
		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
		sessionFactory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Essay essay = (Essay) obj;
		System.out.println(essay.getContent());
		session.save(obj);
		
		transaction.commit();
		session.close();
		sessionFactory.close();
		return null;
	}
	
	public static void delete(Object obj){
		SessionFactory sessionFactory = null;
		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
		sessionFactory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
//		session.delete(obj);

		
		transaction.commit();
		session.close();
		sessionFactory.close();
	}
	
	public static Account accountWrapper(SimpleAccount obj){
		Account account;
		List<Account> accounts = (List<Account>) DBUtils.select("FROM Account WHERE nikename=?", obj.getNikename());
		account = accounts.get(0);

		return account;
	}
	public static Object select(String hql, Object ... limits){
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
		
//		String sql = "SELECT * FROM Account WHERE accountId = :usrnm";
		org.hibernate.query.Query query = session.createQuery(hql);
		
//		query.setParameter("usrnm", 1);
		for(int i = 0; i < limits.length; i++){
			query.setParameter(i, limits[i]);
		}
		
		List<Object> resultList = query.getResultList();
		transaction.commit();
		// 关闭Session
		session.close();
		// 关闭SessionFactory对象
		sessionFactory.close();
		return resultList;
		
		
	}
	
	public static void main(String[] args) {
//		DBUtils.select("FROM Account WHERE nikename=?", "1");
		//如果不懒加载Account则需要在Account.hbm.xml中配置lazy=false.
//		List<Essay> select = (List<Essay>) DBUtils.select("FROM Essay");
//		System.out.println(select.get(0).geteOwner().getNikename());
//		List<Account> select = (List<Account>)DBUtils.select("FROM Account WHERE nikename=?", "ackermander");
//		Account account = select.get(0);
//		System.out.println(account.getNikename());
//		List<Essay> essays = (List<Essay>) DBUtils.select("FROM Essay WHERE header=?", "testnote");
//		Essay essay = essays.get(0);
//		System.out.println(essays.get(0).getAuthor());
//		Comment comment = new Comment();
//		comment.setAuthor("ackermander");
//		comment.setCommentContent("这篇文章写得太好了");
//		comment.setDate(new Date(new java.util.Date().getTime()));
//		comment.setTargetEssay(essay);
//		comment.setCommenter(account);
//		DBUtils.insert(comment);
		delete(null);
//		List<Account> list = ((List<Account>) DBUtils.select("FROM Account WHERE nikename=? and password=?", "ackermander","acmd"));
//		System.out.println(list.size());
	}
}
