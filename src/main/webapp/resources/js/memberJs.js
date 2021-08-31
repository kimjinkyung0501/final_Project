   $(function() {

      // 검색
      $("#option_B").click(function() {

         let option = $("#option option:selected").val();

         alert(option);

         if (option == "search_J") {
            alert("검색 분류를 선택해 주세요");

            return false;

         }
      });

      let test;
      let ex_id;
      let ex_pw;
      let ex_name;
      let ex_addr;
      let ex_phone;
      let ex_grade;
      let ex_email;

      $(".modiBtn")
            .click(
                  function() {

                     $(".div2")
                           .one(
                                 "click",
                                 function() {

                                    $(".div3").empty();
                                    test = $(this).find('.info_id')
                                          .val();
                                    ex_id = $(this)
                                          .find('.info_id').val();
                                    ex_pw = $(this)
                                          .find('.info_pw').val();
                                    ex_name = $(this).find(
                                          '.info_name').val();
                                    ex_addr = $(this).find(
                                          '.info_addr').val();
                                    ex_phone = $(this).find(
                                          '.info_phone').val();
                                    ex_grade = $(this).find(
                                          '.info_grade').val();
                                    ex_email = $(this).find(
                                          '.info_email').val();

                                    console.log(ex_id);
                                    console.log(ex_pw);
                                    console.log(ex_name);
                                    console.log(ex_addr);
                                    console.log(ex_phone);
                                    console.log(ex_grade);
                                    console
                                          .log(ex_email
                                                + '=====================');

                                    $(this)
                                          .find(".div3")
                                          .append(
                                                "<table style='border: 1px solid blue;' >");
                                    $(this)
                                          .find(".div3")
                                          .append(
                                                "<tr><td><input class='new_id' name='m_id' value=" + ex_id + " type='hidden'></td></tr>");
                                    $(this)
                                          .find(".div3")
                                          .append(
                                                "<tr><td>새로운 pw<input class='new_pw' name='m_pw' value=" + ex_pw + "></td></tr>");
                                    $(this)
                                          .find(".div3")
                                          .append(
                                                "<tr><td>새로운 이름<input class='new_name' name='m_name' value=" + ex_name + "></td></tr>");
                                    $(this)
                                          .find(".div3")
                                          .append(
                                                "<tr><td>새로운 주소<input class='new_addr' name='m_addr' value=" + ex_addr + "></td></tr>");
                                    $(this)
                                          .find(".div3")
                                          .append(
                                                "<tr><td>새로운 전화번호<input class='new_phone' name='m_phone' value=" + ex_phone + "></td></tr>");
                                    $(this)
                                          .find(".div3")
                                          .append(
                                                "<tr><td>새로운 레벨<input class='new_grade' name='m_grade' value=" + ex_grade + "></td></tr>");
                                    $(this)
                                          .find(".div3")
                                          .append(
                                                "<tr><td>새로운 E-Mail<input class='new_email' name='m_email' value=" + ex_email + "></td></tr>");
                                    $(this)
                                          .find(".div3")
                                          .append(
                                                "<button class='asd'>수정완료</button></table>");

                                 });
                  })
$('.morebtn').click(function() {
		var moreBtn = $(this);
		var nav = moreBtn.parent().parent().parent().next();
		var div3 = nav.next().children();
		moreBtn.toggleClass('active');
		nav.toggleClass('active');
		div3.toggleClass('hidden');
	});

   });