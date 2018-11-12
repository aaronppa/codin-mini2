/**
 * 
 */

$(window).bind("load", function(e){
	console.log(e);
	$(".canvasboard").on("click",".btn.replyall",function(){
		console.log("reply clicked.");
		var msgId = $(this).parent().siblings(".msgdetails").data("msgid");
		$.get({
			url: "premailreply.do",
			data: "msgId="+msgId
		})
		.done(function(result){
			console.dir("mailreplyall result: ",result)
			var recipientLabel="<li class='removelabel' id='rToUserNo"+result.fromUserNo+"' onclick='removeLabel(this)'>"+result.fromUserName+"("+result.fromUserId+")<i class='fas fa-user-times' id='remove-recipient' data='wToUserNo"+result.fromUserNo+"'><input type='hidden' class='form-control info' id='rToUserNo"+result.fromUserNo+"' name='toUserNo' value='"+result.fromUserNo+"'></i></li>"
			for(var recipient of result.recipients){
				if(recipient.toUserNo==thisUserNo){continue;}
				recipientLabel += "<li class='removelabel' id='rToUserNo"+recipient.toUserNo+"' onclick='removeLabel(this)'>"+recipient.toUserName+"("+recipient.toUserId+")<i class='fas fa-user-times' id='remove-recipient' data='wToUserNo"+recipient.toUserNo+"'><input type='hidden' class='form-control info' id='rToUserNo"+recipient.toUserNo+"' name='toUserNo' value='"+recipient.toUserNo+"'></i></li>"
			}			
			$(".replyfn").replaceWith(
					"<div class='replyform'>" + 
					"<h4><i>회신 메세지 작성</i></h4>"+
					"<form action='/codin_mini/msg/mailreply.do' method='post'>" +
					"<input type='hidden' class='form-control info' id='rfromUserNo' name='fromUserNo' value='"+thisUserNo+"'/>"+
					"<input type='hidden' class='form-control info' id='rthread' name='thread' value='"+result.thread+"'/>"+
					"<input type='hidden' class='form-control info' id='rmsgId' name='msgId' value='"+result.msgId+"'/>"+
					"<input type='hidden' class='form-control info' id='rtypeId' name='typeId' value='"+result.typeId+"'/>"+
					"<span>수신자: </span><ul id='recipientAddedLabel'></ul>"+
					"<span>회신제목:</span><input type='text' class='form-control info' id='rSubject' name='subject' maxlength='50' value='"+"Re: "+
					result.subject+
					"'/><textarea class='form-control message-body' id='summernote_2' name='body'>"+"<br><br>"+
					`<br><br>
					
													
											  --------이전 메세지--------
`+

					result.body+
					"</textarea><div class='replyfn'><button type='button' class='btn cancel' onclick='cancelReply()'>취소</button>"+
//					"<button type='button' class='btn btn-primary'>임시저장</button>" +
					"<button type='submit' class='btn sendreply'>발신</button></form></div></div>"
			);
			$(".replyform > form > ul#recipientAddedLabel").append(recipientLabel);
			$('#summernote_2').summernote({
			    tabsize: 2,
			    height: 180,
			    toolbar: [
			        // [groupName, [list of button]]
			        ['style', ['bold', 'italic', 'underline', 'clear']],
			        ['font', ['strikethrough', 'superscript', 'subscript']],
			        ['fontsize', ['fontsize']],
			        ['color', ['color']],
			        ['para', ['ul', 'ol', 'paragraph']],
			        ['height', ['height']]
			      ]
		    });
			
		});
		
	});
});

function removeLabel(item){
	$(item).remove();
};

function cancelReply(){
	$("div.replyform").replaceWith("<div class='replyfn'><button class='btn replyall'>전체회신</button><button class='btn reply'>회신</button></div>");
};


$(window).bind("load", function(){

});