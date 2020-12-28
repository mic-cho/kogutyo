<!--#include virtual="/m/header.asp" --> 
	</div>
</header>
<hr />
<div id="ct" class="join_bdy">
	<ul class="join_step">
		<li><a href="/m/join_step1.asp">가입1단계</a></li>
		<li><a href="/m/join_step2.asp">가입2단계</a></li>
		<li class="select"><a href="/m/join_step3.asp">가입3단계</a></li>
		<li><a href="/m/join_step4.asp">가입4단계</a></li>
	</ul>
	<h1 class="join_h1">정보입력</h1>
	<div class="join_form1">
		<table width="100%" class="nobrd_tbl" style="table-layout:fixed">
			<col width="90px;"/>
			<col width=""/>
			<tbody>
				<tr>
					<th><span class="chek_bulet"></span>아이디</th>
					<td><div class="style-1">
							<input type="text" size="14">
						</div>
						<p class="f11 m_t_5">4~12자리의 영문 소문자, 숫자 사용</p></td>
				</tr>
				<tr>
					<th><span class="chek_bulet"></span>대표 닉네임</th>
					<td><div class="style-1">
							<input type="text" size="14">
						</div>
						<p class="m_t_5 fc_f00">설정한 대표 닉네임은 변경 불가.</p>
						<p class="f11">아이디와 동일한 별명을 사용하시면 아이디 도용 피해의 위험에 노출될 수 있으니 다르게 만들어주세요</p></td>
				</tr>
				<tr>
					<th><span class="chek_bulet"></span>비밀번호</th>
					<td><div class="style-1">
							<input type="password" size="14">
						</div>
						<p class="m_t_5">4~12자리의 영문 소문자, 숫자 사용</p></td>
				</tr>
				<tr>
					<th><span class="chek_bulet"></span>비밀번호확인</th>
					<td><div class="style-1">
							<input type="password" size="14">
						</div>
						<p class="m_t_5">다시 한번 입력해주세요.</p></td>
				</tr>
				<tr>
					<th><span class="chek_bulet"></span>휴대폰 번호</th>
					<td><div class="style-1">
							<div id="select_box" style="width:64px;">
								<label for="color">국번</label>
								<select id="color" title="select color">
									<option selected="selected">010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
								</select>
							</div> - <input type="text" size="4"> - <input type="text" size="4">
						</div>
						<p class="m_t_5">4~12자리의 영문 소문자, 숫자 사용</p></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="tc m_t_20 m_b_30"><a href="#" class="btn_join_yellow">입력완료</a> <a href="#" class="btn_join_yellow">취 소</a></div>
</div>

<!--#include virtual="/m/footer.asp" -->