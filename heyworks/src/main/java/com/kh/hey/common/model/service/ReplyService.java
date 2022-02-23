package com.kh.hey.common.model.service;

import java.util.ArrayList;

import com.kh.hey.common.model.vo.Reply;

public interface ReplyService {
	
	ArrayList<Reply> ajaxSelectReplyList(String ano);
	int ajaxInsertReply(Reply r);
	int ajaxDeleteReply(String replyNo);
	int ajaxUpdateReply(Reply r);

}
