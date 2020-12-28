

var CalendarLogic = function(year, month) {
	var dateTime;
	
	try {
		dateTime = new C.DateTime();
	} catch(e) {
		return;
	}
	
	if (typeof year != 'undefined' && typeof month != 'undefined') {
		dateTime.setYear(year);
		dateTime.setMonth(month);
	}
	
	this.getMonthInfo = function() {
		var info = {
			year : dateTime.getYear(),
			month : dateTime.getMonth()
		};
		
		dateTime.setDate(1);
		info.firstDay = dateTime.getDay();
		
		dateTime.addMonth(1);
		dateTime.addDate(-1);
		info.dayCount = dateTime.getDate();
		
		return info;
	}
	
	this.prev = function() {
		dateTime.setDate(1);
		dateTime.addMonth(-1);
	}
	
	this.next = function() {
		dateTime.setDate(1);
		dateTime.addMonth(1);
	}
	
	this.prevYear = function() {
		dateTime.setDate(1);
		dateTime.addYear(-1);
	}
	
	this.nextYear = function() {
		dateTime.setDate(1);
		dateTime.addYear(1);
	}
	
	this.setInfo = function(y, m) {
		dateTime.setYear(y);
		dateTime.setMonth(m);
		if (m != dateTime.getMonth()) { // 이상하게 잘 안들어갈 때가 있어서 넣음 ㅜㅜ
			dateTime.setMonth(m);
		}
	}
};

var Calendar = function(tableDOM, year, month, selDate) {
	var logic = new CalendarLogic(year, month);
	
	var onSelectHandler = function(year, month, date) {
		
	};
	
	this.setOnSelect = function(handler) {
		onSelectHandler = handler;
	};
	
	var select = function(y, m, d) {
		year = y;
		month = m;
		selDate = d;
		onSelectHandler(y, m, d);
		logic.setInfo(y, m);
		paint();
	};
	
	var checkLowerbound = function(y, m, d) {
		return true;
	}
	
	var checkUpperbound = function(y, m, d) {
		return true;
	}
	
	var paint = function() {
		var monthInfo = logic.getMonthInfo();
		
		/*
		 * paint year and month
		 */
		tableDOM.find('div strong').html(monthInfo.year + '.' + monthInfo.month); 
		
		/*
		 * fill date into table
		 */
		var date = 1 - monthInfo.firstDay;
		var tr = tableDOM.find('tbody>tr').each(function(n) {
			$j(this).find('td').each(function(n) {
				var target = $j(this);
				
				target.html('');
				target.removeClass('selected');
				
				if (date >= 1 && date <= monthInfo.dayCount) {
					var y = monthInfo.year;
					var m = monthInfo.month;
					var d = date;
						
					if (checkLowerbound(y, m, d) && checkUpperbound(y, m, d)) {
						var link = $j('<a href="#"></a>');
						target.append(link);
						target = link;
					
						link.bind('click', function(event) {
							select(y, m, d);
							return false;
						});
						
						if (year == y && month == m && selDate == d) {
							link.parent().addClass('selected');
						}
						
						if (n == 0) {
							var em = $j('<em></em>');
							target.append(em);
							target = em;
						}
						
						target.removeClass('dimm');
					} else {
						target.addClass('dimm');
					}
					
					target.html(date);
				}
				
				date++;
			});
		});
	}; 
	
	var prev = function() {
		logic.prev();
		paint();
	};
	
	var next = function() {
		logic.next();
		paint();
	};
		
	var prevYear = function() {
		logic.prevYear();
		paint();
	}
	
	var nextYear = function() {
		logic.nextYear();
		paint();
	}
	
	tableDOM.find('div a:first').bind('click', function(event) {
		prevYear();
		return false;
	});
	
	tableDOM.find('div a:last').bind('click', function(event) {
		nextYear();
		return false;
	});
	
	tableDOM.find('div a:nth-child(2)').bind('click', function(event) {
		prev();
		return false;
	});
	
	tableDOM.find('div a:nth-child(4)').bind('click', function(event) {
		next();
		return false;
	});
	
	this.setLowerbound = function(ly, lm, ld) {
		if (ly instanceof C.DateTime) {
			var dateTime = ly;
			ld = dateTime.getDate();
			lm = dateTime.getMonth();
			ly = dateTime.getYear();
		}
		
		var l = ly * 10000 + lm * 100 + ld;
		checkLowerbound = function(y, m, d) {
			var n = y * 10000 + m * 100 + d;
			return l <= n;
		}
	}
	
	this.setUpperbound = function(uy, um, ud) {
		if (uy instanceof C.DateTime) {
			var dateTime = uy;
			ud = dateTime.getDate();
			um = dateTime.getMonth();
			uy = dateTime.getYear();
		}
		
		var u = uy * 10000 + um * 100 + ud;
		checkUpperbound = function(y, m, d) {
			var n = y * 10000 + m * 100 + d;
			return u >= n;
		}
	}
			
	var resetLowerbound = function() {
		checkLowerbound = function(y, m, d) {
			return true;
		};
	}
	
	var resetUpperbound = function() {
		checkUpperbound = function(y, m, d) {
			return true;
		};
	}
	
	this.paint = function() {
		paint();
	}
	
	this.select = function(y, m, d) {
		select(y, m, d);
	}
	
	//paint();
	return this;
} 

var getDayInterval = function(yyyymmdd1, yyyymmdd2){
	var date1 = toTimeObj(yyyymmdd1);
	var date2 = toTimeObj(yyyymmdd2);
	var day = 1000 * 3600 * 24;
	return parseInt((date2 - date1) / day, 10);
}

var toTimeObj = function(yyyymmdd) {
	var year  = yyyymmdd.substr(0,4);
    var month = yyyymmdd.substr(4,2) - 1;
    var day   = yyyymmdd.substr(6,2);
    return new Date(year,month,day);
}