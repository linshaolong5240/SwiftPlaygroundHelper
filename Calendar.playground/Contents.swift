import Cocoa

fileprivate extension Date {
    func nextHour() -> Date {
        var currentDate = Date()
        let passSecond = Calendar.current.component(.second, from: currentDate)
        let passMinute = Calendar.current.component(.minute, from: currentDate)
        let offsetSecond: TimeInterval = TimeInterval(60 - passSecond)
        let offsetMinute: TimeInterval = passMinute > 0 ? TimeInterval(60 - passMinute) : 60
        currentDate += offsetSecond + (offsetMinute - 1) * 60
        return currentDate
    }
    
    func nextHours(count: Int = 1) -> [Date] {
        var hours = [Date]()
        let currentDate = Date()
        let passSecond = Calendar.current.component(.second, from: currentDate)
        let passMinute = Calendar.current.component(.minute, from: currentDate)
        let offsetSecond: TimeInterval = TimeInterval(60 - passSecond)
        let offsetMinute: TimeInterval = passMinute > 0 ? TimeInterval(60 - passMinute) : 60
        let nextHour = currentDate + offsetSecond + (offsetMinute - 1) * 60
        hours.append(nextHour)
        for hourOffset in 1 ..< 1 {
            let hour = Calendar.current.date(byAdding: .hour, value: hourOffset, to: nextHour)!
            #if DEBUG
            print(hour)
            #endif
            hours.append(hour)
        }
        return hours
    }
}

var calendar = Calendar.current
calendar.firstWeekday = 2
let now = Date()
//判断日期是不是今天
Calendar.current.isDateInToday(Date())
//指定日期的当天开始时刻
calendar.startOfDay(for: now)

//指定日期的下个周末时间段
calendar.nextWeekend(startingAfter: Date())

//年起始 年结束
calendar.dateInterval(of: .year, for: now)!.start
calendar.dateInterval(of: .year, for: now)!.end
//月起始 月结束
calendar.dateInterval(of: .month, for: now)!.start
calendar.dateInterval(of: .month, for: now)!.end
//周起始 周结束 包含上个月日期
calendar.dateInterval(of: .weekOfYear, for: now)!.start
calendar.dateInterval(of: .weekOfYear, for: now)!.end
calendar.dateInterval(of: .weekOfMonth, for: now)!.start
calendar.dateInterval(of: .weekOfMonth, for: now)!.end
//当天起始 当天结束
calendar.dateInterval(of: .day, for: now)!.start
calendar.dateInterval(of: .day, for: now)!.end
//小时起始 小时结束
calendar.dateInterval(of: .hour, for: now)!.start
calendar.dateInterval(of: .hour, for: now)!.end
//分钟起始 分钟结束
calendar.dateInterval(of: .minute, for: now)!.start
calendar.dateInterval(of: .minute, for: now)!.end
//秒起始 秒结束
calendar.dateInterval(of: .second, for: now)!.start
calendar.dateInterval(of: .second, for: now)!.end

var months = [Date]()
var weeks = [Date]()
var weekdays = [Date]()

var interval = DateInterval()
//年中每月起始时间
interval = calendar.dateInterval(of: .year, for: now)!
months.append(interval.start)
calendar.enumerateDates(startingAfter: interval.start, matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0), matchingPolicy: .nextTime) { date, strict, stop in
    if let date = date {
        if date < interval.end {
            months.append(date)
        }else {
            stop = true
        }
    }
}
//月中每周起始时间
interval = calendar.dateInterval(of: .month, for: now)!
weeks.append(interval.start)
calendar.enumerateDates(startingAfter: interval.start, matching: DateComponents(hour: 0, minute: 0, second: 0, weekday: 1), matchingPolicy: .nextTime) { date, strict, stop in
    if let date = date {
        if date < interval.end {
            weeks.append(date)
        }else {
            stop = true
        }
    }
}
//周中每天起始时间
interval = calendar.dateInterval(of: .weekOfMonth, for: now)!
weekdays.append(interval.start)
calendar.enumerateDates(startingAfter: interval.start, matching: DateComponents(hour: 0, minute: 0, second: 0), matchingPolicy: .nextTime) { date, strict, stop in
    if let date = date {
        if date < interval.end {
            weekdays.append(date)
        }else {
            stop = true
        }
    }
}

var minutes = [Date]()
interval = calendar.dateInterval(of: .hour, for: now)!
interval.start = now
minutes.append(interval.start)
calendar.enumerateDates(startingAfter: interval.start, matching: DateComponents(second: 0), matchingPolicy: .nextTime) { date, strict, stop in
    if let date = date {
        if date < interval.end {
            minutes.append(date)
        }else {
            stop = true
        }
    }
}

var hours = [Date]()
interval = calendar.dateInterval(of: .hour, for: now)!
interval.start = now
minutes.append(interval.start)
calendar.enumerateDates(startingAfter: interval.start, matching: DateComponents(second: 0), matchingPolicy: .nextTime) { date, strict, stop in
    if let date = date {
        if date < interval.end {
            minutes.append(date)
        }else {
            stop = true
        }
    }
}

print("months:")
print(months)
print("weeks in month:")
print(weeks)
print("week")
print(weekdays)
//判断周中每天日期是不是在同一个月
weekdays.forEach { date in
    if calendar.isDate(date, equalTo: weeks[0], toGranularity: .month) {
        print(date)
    }
}
print("minutes")
print(minutes)


