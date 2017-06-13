package ce.acmd.struts.tag.sort;

import java.util.Comparator;

import ce.acmd.things.clazz.Comment;

public class SortId implements Comparator<Comment> {

	@Override
	public int compare(Comment o1, Comment o2) {
		// TODO Auto-generated method stub
		return o1.getcId().compareTo(o2.getcId());
	}



}
