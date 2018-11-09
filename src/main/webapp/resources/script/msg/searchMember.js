/**
 *  Search Valid users on Write Form Recipient
 */

$(function(){
	console.log($('#searchRecipient').val());
	$('#searchRecipient').autocomplete({
		source: function(request, response){
			$.ajax({
				url: "searchmember.do",
				dataType: "json"
			})
			.done(function(data){
				console.log(data);
				response($.map(data,function(item){
					if(item.memberNameAndId.indexOf($('#searchRecipient').val()) >= 0){
						console.log("item.memberNameAndId: "+item.memberNameAndId);
						return{
							label : item.memberNameAndId.replace($('#searchRecipient').val(), "<span style='font-weight:bold;color:Blue;'>" + $( "#searchRecipient" ).val() + "</span>"),
							value : item.memberName,
							value2 : item.memberId,
							value3 : item.memberNo
						}
					}
				}));
			})
		},
		   /* 한글일 경우 아래키로 내리면 자동완성이 변경된는 것을 방지 */
        focus: function( event, ui ) {
         	event.preventDefault();
        	},
        minLength: 2,
        select: function( event, ui ) {
        	event.preventDefault();
        	memberValue(ui.item.value, ui.item.value2, ui.item.value3);  
        },
        change: function (event, ui) {
            if (!( ui.item)) {
            	event.target.value = "";
           		alert("검색하신 사용자 계정이 존재하지 않습니다. 다시 입력해주세요.")
           	}
        },
        open: function() {
        	console.log($(this).css("z-index"));
            $( this ).autocomplete("widget").width("134px");
            $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
        },
        
        close: function() {
            $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
        },
        error: function(xhr, ajaxOptions, thrownError){ alert(thrownError);  alert(xhr.responseText); }
    })
    // 자동완성 리스트 만들기 
    .data('uiAutocomplete')._renderItem = function( ul, item ) {
		console.log("data attr added");
        return $( "<li style='cursor:hand; cursor:pointer;'></li>" )
            .data( "item.autocomplete", item )
            .append(item.value+" - "+item.value2)
        .appendTo( ul );
    };
});
	
// 유효한 리스트를 선택(click)하면 input textbox 옆에 라벨(삭제가능)이 추가되고, input field는 비워짐  
function memberValue(mName, mId, mNo) {
	console.log("mName: "+mName+", "+"mId: "+mId+", "+"mNo: "+mNo);
	var recipientLabel = "<li class='removelabel' id='wToUserNo"+mNo+"'>"+mName+"("+mId+")<i class='fas fa-user-times' id='remove-recipient' data='wToUserNo"+mNo+"'><input type='hidden' class='form-control info' id='wToUserNo"+mNo+"' name='toUserNo' value='"+mNo+"'></i></li>"
	$("#recipientAddedLabel").append(recipientLabel);
 	console.log($("input#wToUserNo"+mNo).val());
 	$("input#searchRecipient").val('');
};

// 추가된 수신자 라벨 누르면 삭제기능 
$("#recipientAddedLabel").on("click",'.removelabel', function(){
	$(this).remove();
});

