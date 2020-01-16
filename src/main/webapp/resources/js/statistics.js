/**
 * statistics.jsp 
 */

google.charts.load('current', {'packages':['corechart']});

google.charts.setOnLoadCallback(ageGroupChart);
google.charts.setOnLoadCallback(genderChart);
google.charts.setOnLoadCallback(ArticleChart);
google.charts.setOnLoadCallback(ArticleCategory);
google.charts.setOnLoadCallback(ArticleCount);

function ageGroupChart() {

	var jsonData = $.ajax({
		url : "AgeGroupData",
		dataType : "json",
		async : false
	}).responseText;

	var data = new google.visualization.DataTable(jsonData);

	var options = {
			'title':'회원 나이대별 비율',
			'width':390,
			'height':300,
			animation : {
				startup: true,
				duration: 1000,
			},
	};

	var chart = new google.visualization.PieChart(document.getElementById('stat_agegroup_chart'));
	chart.draw(data, options);
}
function genderChart() {

	var jsonData = $.ajax({
		url : "GenderData",
		dataType : "json",
		async : false
	}).responseText;

	var data = new google.visualization.DataTable(jsonData);

	var options = {
			'title':'회원 성별 비율',
			'width':390,
			'height':300,
			animation : {
				startup: true,
				duration: 1000,
			},
	};

	var chart = new google.visualization.PieChart(document.getElementById('stat_gender_chart'));
	chart.draw(data, options);
}
function ArticleChart() {

	var jsonData = $.ajax({
		url : "ArticleData",
		dataType : "json",
		async : false
	}).responseText;

	var data = new google.visualization.DataTable(jsonData);

	var options = {
			'title':'게시글 잠금비율',
			'width':390,
			'height':300,
			animation : {
				startup: true,
				duration: 1000,
			},
	};

	var chart = new google.visualization.PieChart(document.getElementById('stat_article_chart'));
	chart.draw(data, options);
}

function ArticleCategory() {

	var jsonData = $.ajax({
		url : "ArticleCategory",
		dataType : "json",
		async : false
	}).responseText;
	var data = new google.visualization.DataTable(jsonData);

	var view = new google.visualization.DataView(data);

	var options = {
			title: "카테고리별 게시물 / 선호카테고리 선택 수",
			height: 400,
				bar: {groupWidth: "30%"},
			sliceVisibilityThreshold : 0,
			animation : {
				startup: true,
				duration: 1000,
				easing: 'linear',
			},
			colors : ['#f57c68','green']
	};

	var chart = new google.visualization.ColumnChart(document.getElementById('stat_category_chart'));
	chart.draw(data, options);	
}

function ArticleCount() {
	
	var jsonData = $.ajax({
		url : "ArticleCount",
		dataType : "json",
		async : false
	}).responseText;
	console.log(jsonData);
	var data = new google.visualization.DataTable(jsonData);
	
	var view = new google.visualization.DataView(data);
	
	var options = {
			title: "일별 게시글 / 책 / 방문자 수",
			height: 400,
			bar: {groupWidth: "30%"},
			sliceVisibilityThreshold : 0,
			seriesType : 'bars',
			series : {2 : {type : 'line'}},
			animation : {
				startup: true,
				duration: 1000,
				easing: 'linear',
			},
			colors : ['#f57c68','green','orange']
	};
	
	var chart = new google.visualization.ComboChart(document.getElementById('stat_artCount_chart'));
	chart.draw(data, options);	
}
