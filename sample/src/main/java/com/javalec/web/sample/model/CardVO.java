package com.javalec.web.sample.model;

import com.javalec.web.sample.tool.Pagination;

public class CardVO {

	public int card_num;
	public String word;
	public String meaning;
	public String important;
	public String user;
	public String uid;
	public String list_name;
	public String list_explain;
	public String privacy;
	public String bookmark;
	Pagination pagination;
	
	public int getCard_num() {
		return card_num;
	}
	public void setCard_num(int card_num) {
		this.card_num = card_num;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getMeaning() {
		return meaning;
	}
	public void setMeaning(String meaning) {
		this.meaning = meaning;
	}
	public String getImportant() {
		return important;
	}
	public void setImportant(String important) {
		this.important = important;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getList_name() {
		return list_name;
	}
	public void setList_name(String list_name) {
		this.list_name = list_name;
	}
	public String getList_explain() {
		return list_explain;
	}
	public void setList_explain(String list_explain) {
		this.list_explain = list_explain;
	}
	
	public String getPrivacy() {
		return privacy;
	}
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
	public String getBookmark() {
		return bookmark;
	}
	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}
	@Override
	public String toString() {
		return "CardVO [card_num=" + card_num + ", word=" + word + ", meaning=" + meaning + ", important=" + important
				+ ", user=" + user + ", uid=" + uid + ", list_name=" + list_name + ", list_explain=" + list_explain
				+ ", privacy=" + privacy + ", bookmark=" + bookmark + ", pagination=" + pagination + "]";
	}
	
	
	
	
}
