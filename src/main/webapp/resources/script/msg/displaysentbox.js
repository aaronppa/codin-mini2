/**
 *  Displaying Msg(AllMsg, Mail, Memo, Announcement, Draft, excluding trash and sent) Script
 */

function displaysentbox(){
	$.ajax({
	url: "displaysentmsg.do",
	dataType:"json",
	})
	.done(function(data){
		for(var msgitem of data){
			console.dir(msgitem);
			/* Msg Type Icon Select */
			var typeIcon;
			switch(msgitem.typeId){
			case 1 : typeIcon = "<i class='fab fa-stack-exchange'></i>";
					break;
			case 2 : typeIcon = "<i class='far fa-file-alt'></i>";
					break;
			case 3 : typeIcon = "<i class='fas fa-bullhorn'></i>";
					break;
			case 4 : typeIcon = "<i class='far fa-edit'></i>";
					break;
			default : typeIcon = "<i class='fas fa-question'></i>";
			}
			
//			if none of the recipients read the message can be deleted. 
			
			var sent = 0;
			if(msgitem.dateSent!=null){
				sent = 1;
			}
			var html = "<tr class='msgitem clickable-row' data-msgid='"+msgitem.msgId+"'data-msgtype='"+msgitem.typeId+"' data-sent='"+sent+"'>"+
					    "<td class='msgitem chkbox'id='thtrwidth-1'><div class='checkbox'><input type='checkbox' name='msgId' value='"+msgitem.msgId+"'></div></td>"+
					    "<td class='msgitem msgtype' id='thtrwidth-2'>"+typeIcon+"</td>"+"<td class='msgitem msgstatus' id='thtrwidth-3'><i class='fal fa-paper-plane'></i></td>"+
					    "<td class='msgitem toUser' id='thtrwidth-4' id='toUser' data-fromUserNo='"+msgitem.fromUserNo+"'></td>"+
					    "<td class='msgitem subject' id='thtrwidth-5'>"+msgitem.subject+
					    "</td><td class='msgitem date' id='thtrwidth-6'>"+$.format.date(msgitem.dateSent,'yyyy-MM-dd HH:mm')+
						"</td></tr>";
			
			$("#msglistresult").append(html);
			
		};
	})
	.fail(function(err){
			alert("로그인이 되지 않은 것 같네요. 로그인 페이지로 이동합니다.");
			window.location.pathname = '/codin_mini/msgtest.jsp';
	});
	
	// Message Item Detail View 
	
	$("#msglistresult").on("click",".clickable-row",function(e){
		/* console.log("type: "+$(this).data("msgtype")+", read: "+$(this).data("read")); */
		console.log($(this).data("msgid"));
		console.dir(e.target);
		if (e.target.classList[1] == "chkbox" || e.target.type == "checkbox" || e.target.className == "checkbox") {
	        // stop the bubbling to prevent firing the row's click event
	        e.stopPropagation();
	    } else {
			var $td = $(this);
			if($td.data("msgtype")==1){
				if($td.data("read")==0){
					$.get({
						url: "updateread.do",
						data: "msgId="+$td.data("msgid")
					})
					.done(function(){
						alert("본문내용없는 쪽지를 확인하셨습니다.");
						$td.data("read","1");
						$td.find(".msgstatus").html("<i class='far fa-envelope-open'></i>");
					});
				} else {
					alert("본문내용없는 확인하신 쪽지입니다.");
					return;
				};
			} else{
				$.get({
					url: "msgitemdetail.do",
					data: "msgId="+$td.data("msgid"),
					datatype: "json"
				})
				.done(function(result){
					console.dir(result);
					console.dir(result.recipients);
					$(".canvasboard").html(
						`<div>`		
					);
				});		
			}; 
	    };
	});
};