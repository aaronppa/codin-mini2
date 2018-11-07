/**
 *  Displaying Msg(AllMsg, Mail, Memo, Announcement, Draft, excluding trash and sent) Script
 */

function displayinbox(typeIdParam){
	$.ajax({
	url: "displaymsg.do",
	dataType:"json",
	data: "typeId="+typeIdParam
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
			
			/* Msg Read-Status Icon Select */
			var statusIcon;
			if(msgitem.dateRead!=null){
				statusIcon = "<i class='far fa-envelope-open'></i>";
			} else {
				statusIcon = "<i class='far fa-envelope'></i>";
				if(msgitem.trashRecipient!=0){
					statusIcon = "<i class='far fa-trash-alt'></i>";
				}
			}
			
			var read = 0;
			if(msgitem.dateRead!=null){
				read = 1;
			}
			var html =  "<tr class='msgitem clickable-row' data-msgid='"+msgitem.msgId+"'data-msgtype='"+msgitem.typeId+"' data-read='"+read+"'>"+
					    "<td class='msgitem chkbox'id='thtrwidth-1'><div class='checkbox'><input type='checkbox' name='msgId' class='select-checkbox' value='"+msgitem.msgId+"'></div></td>"+
					    "<td class='msgitem msgtype' id='thtrwidth-2'>"+typeIcon+"</td>"+"<td class='msgitem msgstatus' id='thtrwidth-3'>"+statusIcon+"</td>"+
					    "<td class='msgitem fromUser' id='thtrwidth-4' id='fromUser' data-fromUserId='"+msgitem.fromUserId+"' data-fromUserName='"+msgitem.fromUserName+"' data-fromUserNo='"+msgitem.fromUserNo+"'>"+
					    	msgitem.fromUserName+"("+msgitem.fromUserId+")"+"</td>"+
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
};

// Displaying Draft/Sent Msg
function displaydrafsentbox(typeIdParam){
	$.ajax({
	url: "displaydraftsentmsg.do",
	dataType:"json",
	data: "typeId="+typeIdParam
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
			var html =  "<tr class='msgitem clickable-row' data-msgid='"+msgitem.msgId+"'data-msgtype='"+msgitem.typeId+"' data-sent='"+sent+"'>"+
					    "<td class='msgitem chkbox'id='thtrwidth-1'><div class='checkbox'><input type='checkbox' name='msgId' class='select-checkbox' value='"+
					    msgitem.msgId+"' data-fromUserNo='"+msgitem.fromUserNo+"'></div></td>"+
					    "<td class='msgitem msgtype' id='thtrwidth-2'>"+typeIcon+"</td>"+
					    "<td class='msgitem msgstatus' id='thtrwidth-3'><i class='far fa-paper-plane'></i></i></td>"+
					    "<td class='msgitem toUser' id='thtrwidth-4' id='toUser' data-fromUserNo='"+msgitem.fromUserNo+"'>To:&nbsp;";
			
			var arrlength = msgitem.recipients.length;
			console.log("# of recipient array: "+arrlength);
			var count = 0;
			for(var recipient of msgitem.recipients){
				html += recipient.toUserName+"("+recipient.toUserId+")";
				count++;
				console.log("count: "+count);
				if (count<arrlength){
					html+=",&nbsp;";
				}
				
			}
				html += "</td><td class='msgitem subject' id='thtrwidth-5'>"+msgitem.subject+
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


// Displaying Trash Message
function displaytrashbox(){
	$.ajax({
	url: "displaytrashmsg.do",
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
			
			var trash = 0;
			if(msgitem.trashWriter==1 || msgitem.trashRecipient==1){
				trash = 1;
			}
			
			var html = 	"<tr class='msgitem clickable-row' data-msgid='"+msgitem.msgId+"'data-msgtype='"+msgitem.typeId+"' data-trash='"+trash+"'>"+
					    "<td class='msgitem chkbox'id='thtrwidth-1'><div class='checkbox'>"+
					    "<input type='checkbox' name='msgId' class='select-checkbox' value='"+msgitem.msgId+"''data-msgtype='"+msgitem.typeId+"' data-fromUserNo='"+
					    msgitem.fromUserNo+"'/></div></td>"+
					    "<td class='msgitem msgtype' id='thtrwidth-2'>"+typeIcon+"</td>"+
					    "<td class='msgitem msgstatus' id='thtrwidth-3'><i class='far fa-trash-alt'></i></i></td>"+
					    "<td class='msgitem trash fromUser' id='thtrwidth-4' id='fromUser' data-fromUserNo='"+
					    msgitem.fromUserNo+"'>From:&nbsp;"+msgitem.fromUserName+"("+msgitem.fromUserId+")</td>"+
					    "<td class='msgitem trash toUser' id='thtrwidth-4' id='toUser'>To:&nbsp;";
				 
			var arrlength = msgitem.recipients.length;
			console.log("# of recipient array: "+arrlength);
			var count = 0;
			for(var recipient of msgitem.recipients){
				html += recipient.toUserName+"("+recipient.toUserId+")";
				count++;
				console.log("count: "+count);
				if (count<arrlength){
					html+=",&nbsp;";
				}
				
			}
				html += "</td><td class='msgitem subject' id='thtrwidth-7'>"+msgitem.subject+
					    "</td><td class='msgitem date' id='thtrwidth-6'>"+$.format.date(msgitem.dateSent,'yyyy-MM-dd HH:mm')+
						"</td></tr>";
			
			$("#msglistresult").append(html);
			
		};
	})
	.fail(function(err){
			alert("로그인이 되지 않은 것 같네요. 로그인 페이지로 이동합니다.");
			window.location.pathname = '/codin_mini/msgtest.jsp';
	});
};


// Checkbox Select Message Item
$(window).bind("load", function(){
	$("#selectall").on("click", function(e){
		if($(this).is(':checked',true))  
		{
			$(".select-checkbox").prop('checked', true);  
		}  
		else  
		{  
			$(".select-checkbox").prop('checked',false);  
		}  
	});


	$(".trashicon")
});


//<!-- Trash Messages -->
// 보낸메세지에 경우 삭제하더라도 본인 보낸메세지함에서 휴지통으로 가고, 수신자의 메세지 함에는 메세지 그대로 보임. 		
$('.trashicon').on('click', function(e) { 
	console.log(e.target);
	var allVals = [];
	// Received Messages msgKind=0;
	// Trash Sent/Draft Messages msgKind=1;
	var msgKind=0;
	$(".select-checkbox:checked").each(function() {  
		allVals.push($(this).val());
		if($(this).data("fromuserno")==thisUserNo){
			msgKind=1;
		}
	});  
	//alert(allVals.length); return false;  
	if(allVals.length <=0)  
	{  
		alert("선택하신 메세지가 없습니다.");  
	}  
	else {  			
		WRN_PROFILE_DELETE = "선택하신 메세지를 정말 휴지통으로 이동하시겠습니까?";  
		var check = confirm(WRN_PROFILE_DELETE);  
		if(check == true){  
			var join_selected_values = allVals.join(",");
			if(msgKind==0){
				$.ajax({     
					type: "POST",  
					url: "trashreceivedmsg.do",  
					cache:false,  
					data: 'msgId='+join_selected_values
				})
				.done(function(){
					$.each(allVals, function( index, value ) {
						$('table tr').filter("[data-msgid='" + value + "']").remove();
					});
				});
			} else{
				$.ajax({     
					type: "POST",  
					url: "trashdraftsentmsg.do",  
					cache:false,  
					data: 'msgId='+join_selected_values
				})
				.done(function(){
					$.each(allVals, function( index, value ) {
						$('table tr').filter("[data-msgid='" + value + "']").remove();
					});
				});
			}
		}  
	}  
});


//<!-- Restore Deleted Messages -->
$('.restoreicon').on('click', function(e) { 
	console.log(e.target);
	var rMsgVals = []; 
	var sdMsgVals = [];
	
	$(".select-checkbox:checked").each(function() {  
		if($(this).data("fromuserno")==thisUserNo){
			sdMsgVals.push($(this).val());
		} else {
			rMsgVals.push($(this).val());
		}
	});
	
	//alert(allVals.length); return false;  
	if(rMsgVals.length <=0 || sdMsgVals.length <=0)  
	{  
		alert("선택하신 메세지가 없습니다.");  
	}  
	else {  		
		WRN_PROFILE_DELETE = "선택하신 모든 메세지를 복원하시겠습니까?";  
		var check = confirm(WRN_PROFILE_DELETE);  
		if(check == true){  
			var join_selected_rMsgValues = rMsgVals.join(","); 		
			var join_selected_sdMsgValues = sdMsgVals.join(","); 		
			// 받은 메세지 일경우 
			$.ajax({     
				type: "POST",  
				url: "restorereceivedmsg.do",  
				cache:false,  
				data: 'msgId='+join_selected_rMsgValues
			})
			.done(function(){
				$.each(allVals, function( index, value ) {
					$('table tr').filter("[data-msgid='" + value + "']").remove();
				});
			});
			// Sent/Draft 메세지 일경우 
			$.ajax({     
				type: "POST",  
				url: "restoredraftsentmsg.do",  
				cache:false,  
				data: 'msgId='+join_selected_sdMsgValues
			})
			.done(function(){
				$.each(rMsgVals, function( index, value ) {
					$('table tr').filter("[data-msgid='" + value + "']").remove();
				});
				$.each(sdMsgVals, function( index, value ) {
					$('table tr').filter("[data-msgid='" + value + "']").remove();
				});
			});
		}  
	}  
	
});
