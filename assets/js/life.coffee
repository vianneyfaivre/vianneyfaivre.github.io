---
---
MONTHS_PER_ROW = 36
MONTHS_LABELS = ['January','February','March','April','May','June','July','August','September','October','November','December']
MY_BIRTHDATE = new Date(1991, 3, 17)
TODAY = new Date()
MAX_AGE = 100

EventType = 
  WORK : '👔'
  RETIREMENT: '🎉'
  TRAVEL : '🌍'
  HUNDRED: '💯'
  GRADUATION: '🎓'
  SOCCER: '⚽'
  BIRTH: '👶'
  SCHOOL: '🏫'
  BLOG: '📝'
  MOVE: '📦'
  DRIVE: '🚘'
  MOTORCYCLE: '🛵'
  COVID19: '😷' 
  SPORT: '🏃'
  BREAD: '🥖'

State = 
  NOT_BORN: 0
  PAST: 1
  CURRENT: 2
  FUTURE: 3
  BIRTHDAY: 4
  FUTURE_BIRTHDAY: 5

class Event
    constructor: (@year, @month, @type, @label, @place) ->

    draw: () -> 
        switch @type
            when EventType.WORK then "Started working at #{@label} (#{@place})"
            when EventType.RETIREMENT then "Probable #{@label}"
            when EventType.TRAVEL then "Travelled #{@label} to #{@place}"
            when EventType.GRADUATION then "Got a #{@label}"
            when EventType.MOVE then "Moved to #{@place}"
            when EventType.SCHOOL then "Entered #{@label}"
            else "#{@label}"

class Year 
    constructor: (@year, @months) ->

class Month 
    constructor: (@absoluteMonthNumber, @relativeMonthNumber, @year, @state, @events) ->

    label: () -> MONTHS_LABELS[@relativeMonthNumber]

    isBirthday: () -> @state == State.BIRTHDAY || @state == State.FUTURE_BIRTHDAY
    
    age: () -> getAge(MY_BIRTHDATE, new Date(@year, @relativeMonthNumber, 1))

    getCssClass: () ->
        switch @state
            when State.PAST then "passed-month"
            when State.CURRENT then "current-month"
            when State.FUTURE then "remaining-month"
            when State.BIRTHDAY then "passed-month birthday"
            when State.FUTURE_BIRTHDAY then "remaining-month"
            else "invalid-month"
    
    draw: () ->
        emojisHtml = ""
        emojis = []
        eventsHtml = ""

        title = "#{MONTHS_LABELS[@relativeMonthNumber]}&nbsp;#{@year}"
        
        if @state == State.BIRTHDAY and @age() > 0
            emojis.push "🍰"
            eventsHtml += "<li>Turned #{@age()} years old</li>"
        
        for event in @events
            emojis.push event.type
            eventsHtml += "<li>#{event.draw()}</li>"

        if eventsHtml != ""
            eventsHtml = "<ul>#{eventsHtml}</ul>"
       
        if emojis.length == 1
            emojisHtml = "<div class='emoji'>#{emojis.join('')}</div>"
        else if emojis.length > 1
            emojisHtml = "<div class='emojis'>#{emojis.join('')}</div>"
        else 
            return ""

        return """
            #{emojisHtml}
            <div class='tooltip'>
                <div class='tooltip-content'>
                    <div>#{title}</div>
                    #{eventsHtml}
                </div>
            </div>"""

EVENTS = [

    new Event(2008, 8, EventType.MOVE, "", "Nantes, France 🇫🇷"),
    new Event(2016, 10, EventType.MOVE, "", "Montréal, Canada 🍁🇨🇦"),
    new Event(2019, 1, EventType.MOVE, "", "Auckland, New Zealand 🥝🇳🇿"),
    new Event(2021, 4, EventType.MOVE, "", "France 🇫🇷"),
    new Event(2022, 1, EventType.MOVE, "", "Chateaubourg, France 🇫🇷"),
    new Event(2022, 6, EventType.MOVE, "", "Ancenis, France 🇫🇷"),
    new Event(2023, 6, EventType.MOVE, "", "Ancenis, France 🇫🇷"),

    new Event(2008, 6, EventType.GRADUATION, "Baccalauréat"),
    new Event(2010, 6, EventType.GRADUATION, "Techincal Degree"),
    new Event(2011, 6, EventType.GRADUATION, "Bachelor's Degree"),
    new Event(2013, 8, EventType.GRADUATION, "Master's Degree"),

    new Event(2013, 4, EventType.TRAVEL, "one week", "Marrakech, Morocco 🇲🇦"),
    new Event(2013, 11, EventType.TRAVEL, "one week", "Brussels, Belgium 🇧🇪"),
    new Event(2014, 11, EventType.TRAVEL, "one week", "Dublin, Ireland 🇮🇪☘️"),
    new Event(2015, 11, EventType.TRAVEL, "two weeks", "Prague, Czech Republic 🇨🇿"),
    new Event(2016, 4, EventType.TRAVEL, "one week", "Dublin, Ireland 🇮🇪☘️ & Belfast, North Ireland 🇬🇧"),
    new Event(2016, 7, EventType.TRAVEL, "one week", "Budapest, Hungary 🇭🇺"),
    new Event(2016, 8, EventType.TRAVEL, "one week", "Milano, Italy 🇮🇹"),
    new Event(2017, 2, EventType.TRAVEL, "two weeks", "Iceland 🇮🇸"),
    new Event(2017, 6, EventType.TRAVEL, "two weeks", "New York City, USA 🗽"),
    new Event(2017, 7, EventType.TRAVEL, "two weeks", "Yucatán & Quintana Roo, Mexico 🇲🇽"),
    new Event(2017, 11, EventType.TRAVEL, "two weeks", "Dominican Republic 🇩🇴"),
    new Event(2018, 5, EventType.TRAVEL, "two weeks", "Lac Saint-Jean (QC), Canada 🍁🇨🇦"),
    new Event(2018, 2, EventType.TRAVEL, "two weeks", "Cuba 🇨🇺"),
    new Event(2018, 7, EventType.TRAVEL, "two weeks", "Gaspésie (QC), Canada 🍁🇨🇦 & New York City, USA 🗽"),
    new Event(2018, 11, EventType.TRAVEL, "two weeks", "Eastern France 🇫🇷"),
    new Event(2019, 0, EventType.TRAVEL, "four days", "Edinburgh, Scotland 🇬🇧"),
    new Event(2019, 3, EventType.TRAVEL, "five days", "Rotorua/Taupo area, New Zealand 🥝🇳🇿"),
    new Event(2019, 5, EventType.TRAVEL, "one week", "Coromandel area, New Zealand 🥝🇳🇿"),
    new Event(2019, 7, EventType.TRAVEL, "four days", "Wellington, New Zealand 🥝🇳🇿"),
    new Event(2019, 9, EventType.TRAVEL, "three days", "Northland, New Zealand 🥝🇳🇿"),
    new Event(2019, 11, EventType.TRAVEL, "three weeks", "South Island, New Zealand 🥝🇳🇿"),
    new Event(2020, 8, EventType.TRAVEL, "one week", "Coromandel area, New Zealand 🥝🇳🇿"),
    new Event(2020, 10, EventType.TRAVEL, "two weeks", "South of the North Island, New Zealand 🥝🇳🇿"),
    new Event(2020, 11, EventType.TRAVEL, "one month", "South Island, New Zealand 🥝🇳🇿"),
    new Event(2021, 5, EventType.TRAVEL, "three months", "everywhere, France 🇫🇷"),
    new Event(2022, 3, EventType.TRAVEL, "three days", "Amsterdam, Netherlands 🇳🇱"),
    new Event(2022, 5, EventType.TRAVEL, "one week", "Greece ⛵🇬🇷"),
    new Event(2022, 7, EventType.TRAVEL, "one week", "Biarritz, France 🇫🇷"),
    new Event(2022, 8, EventType.TRAVEL, "one month", "Argentina 🇦🇷"),
    new Event(2023, 1, EventType.TRAVEL, "one week", "Valmorel, France 🇫🇷"),
    new Event(2023, 5, EventType.TRAVEL, "one week", "Route des Vins, Alsace & Bourgogne, France 🇫🇷"),
    new Event(2023, 6, EventType.TRAVEL, "one week", "Annecy & Aix-les-Bains, France 🇫🇷"),
    new Event(2023, 8, EventType.TRAVEL, "three days", "Roscoff, France 🇫🇷"),
    new Event(2023, 8, EventType.TRAVEL, "four days", "Pornic-Ancenis by bike, France 🇫🇷"),
    new Event(2024, 1, EventType.TRAVEL, "one week", "Les Arcs, France 🇫🇷"),
    new Event(2024, 1, EventType.TRAVEL, "four days", "Lyon/Aix-Les-Bains, France 🇫🇷"),
    new Event(2024, 2, EventType.TRAVEL, "one week", "Dijon, France 🇫🇷"),
    new Event(2024, 6, EventType.TRAVEL, "one week", "Crozon & Perros-Guirec, France 🇫🇷"),

    new Event(2010, 3, EventType.WORK, "DB Schenker (internship + two months contract)", "Montaigu, France"),
    new Event(2011, 3, EventType.WORK, "Akka Technologies (3 months internship)", "Nantes, France"),
    new Event(2011, 6, EventType.WORK, "DB Schenker (two months contract)", "Montaigu, France"),
    new Event(2011, 8, EventType.WORK, "Scalian (two years apprenticeship)", "Nantes, France"),
    new Event(2013, 8, EventType.WORK, "Scalian", "Nantes, France"),
    new Event(2015, 2, EventType.WORK, "Orange Business Services", "Nantes, France"),
    new Event(2016, 10, EventType.WORK, "Cogeco", "Montréal, Canada"),
    new Event(2019, 3, EventType.WORK, "University of Auckland", "Auckland, New Zealand"),
    new Event(2021, 7, EventType.WORK, "Disneyland Paris", "Remote, France"),

    new Event(MY_BIRTHDATE.getFullYear(), MY_BIRTHDATE.getMonth(), EventType.BIRTH, "Birth", null)
    new Event(2013 + 40, 0, EventType.RETIREMENT, "Retirement", null),
    new Event(2091, 3, EventType.HUNDRED, "100th birthday", null),

    # 1993 - 1994 - petite section
    # 1994 - 1995 - moyenne section
    # 1995 - 1996 - grande section
    # 1996 - 1997 - cp
    # 1997 - 1998 - ce1
    # 1998 - 1999 - ce2
    # 1999 - 2000 - cm1
    # 2000 - 2001 - cm2
    # 2001 - 2002 - sixieme
    # 2002 - 2003 - cinquieme
    # 2003 - 2004 - quatrieme
    # 2004 - 2005 - troisieme
    # 2005 - 2006 - seconde
    # 2006 - 2007 - premiere
    # 2007 - 2008 - terminale
    new Event(1993, 8, EventType.SCHOOL, "Kindergarten", null);
    new Event(1996, 8, EventType.SCHOOL, "Primary School", null);
    new Event(2001, 8, EventType.SCHOOL, "Secondary School", null);
    new Event(2005, 8, EventType.SCHOOL, "High School", null);
    new Event(2008, 8, EventType.SCHOOL, "University", null);

    new Event(2005, 3, EventType.MOTORCYCLE, "Got Small Motorcycle License", null),
    new Event(2009, 3, EventType.DRIVE, "Got Driver's License", null),

    new Event(2014, 10, EventType.BLOG, "Started blogging", null),
    new Event(2018, 6, EventType.SOCCER, "Fifa World Cup Champion ⭐⭐", null),
    new Event(2020, 2, EventType.SPORT, "Started doing yoga", null),
    new Event(2019, 8, EventType.BREAD, "Started making bread & brioche", null),
    
    new Event(2020, 2, EventType.COVID19, "COVID-19 New-Zealand Lockdown", null),
    new Event(2020, 3, EventType.COVID19, "COVID-19 New-Zealand Lockdown", null),
    new Event(2020, 4, EventType.COVID19, "COVID-19 New-Zealand Lockdown", null),
    new Event(2020, 7, EventType.COVID19, "COVID-19 New-Zealand Lockdown", null),
]

main = () ->
  age = getAge(MY_BIRTHDATE, TODAY)

  years = generateYears(age)
  table = generateTable(years)

  resultDiv = document.getElementById("main-content")
  resultDiv.appendChild(table)

  document.getElementById("intro").innerHTML = "Each row represents #{MONTHS_PER_ROW / 12} years of my life"

generateTable = (years) ->
    table = document.createElement("table")
    
    age = 0
    monthIndex = -1
    row = table.insertRow()
    generateYearsRange(row, age)

    allMonths = years.map((year) -> year.months)
    allMonths = [].concat.apply([], allMonths)

    for month in allMonths

        if shouldCreateNewRow(++monthIndex)
            monthIndex = 0 
            row = table.insertRow()
            generateYearsRange(row, age)

        cell = row.insertCell()
        cell.className = month.getCssClass()

        if month.isBirthday()
            age++

        cell.innerHTML = month.draw() 

        # Display tooltip in desktop and mobile
        cell.addEventListener("click", (event) -> this.classList.toggle('tooltip-show'));
        cell.addEventListener("mouseover", (event) -> this.classList.add('tooltip-show'));
        cell.addEventListener("mouseout", (event) -> this.classList.remove('tooltip-show'));

        # DEBUG
        # cell.innerHTML += ' ' + month.label().substring(0, 3) + "/" + month.year
        # cell.innerHTML = month.state

    # end for : months

    # Generate header row
    headerRow = table.createTHead().insertRow(0)
    headerRow.insertCell(0)

    for headerCellIndex in [0..MONTHS_PER_ROW - 1]
        headerCell = headerRow.insertCell(headerCellIndex + 1)
        
        month = MONTHS_LABELS[headerCellIndex %% 12]

        if month
            headerCell.innerHTML = if month then month.substring(0, 3) else ""

    return table

generateYears = (currentAge) ->
    
    years = []

    monthsAlreadySpent = getMonthsAlreadySpent(currentAge, MY_BIRTHDATE, TODAY)
    
    # Life starts at birth year
    lifeYear = MY_BIRTHDATE.getFullYear()
    age = 0

    # Number of months before actual birth
    invalidMonths = MY_BIRTHDATE.getMonth()

    absoluteMonthNumber = 0
    relativeMonthNumber = 0

    rowsCount = (MAX_AGE * 12) / MONTHS_PER_ROW

    for yearIndex in [0..rowsCount]

        months = []

        for monthIndex in [0..MONTHS_PER_ROW - 1]

            if relativeMonthNumber == 12
                relativeMonthNumber = 0

            monthState = getMonthState(age, absoluteMonthNumber, invalidMonths, monthsAlreadySpent, relativeMonthNumber, lifeYear)

            monthEvents = EVENTS.filter((event, i) -> event.month == relativeMonthNumber and event.year == lifeYear)

            month = new Month(absoluteMonthNumber, relativeMonthNumber, lifeYear, monthState, monthEvents)

            if month.isBirthday()
                age++

            absoluteMonthNumber++
            relativeMonthNumber++

            months.push(month)

            if months.length == 12
                lifeYear++
                years.push(new Year(lifeYear, months))
                months = []
            
        # end for : months
        
    # end for : years

    return years

generateYearsRange = (row, age) ->
    ageIncreasePerRow = (MONTHS_PER_ROW / 12) 

    if age == 0
        minAge = 0
        maxAge = ageIncreasePerRow - 1
    else
        minAge = age - 1
        maxAge = age + ageIncreasePerRow - 1

    newCell = row.insertCell(0)
    newCell.innerHTML = "#{minAge}-#{maxAge}"
    newCell.className = "years-range"

getMonthState = (age, absoluteMonthNumber, invalidMonths, monthsAlreadySpent, relativeMonthNumber, lifeYear) ->

    notBornYet = isNotBorn(age, absoluteMonthNumber, invalidMonths)
    isFutureMonth = isInFuture(relativeMonthNumber, lifeYear) 
    currentMonth = isFutureMonth and relativeMonthNumber == TODAY.getMonth() and lifeYear == TODAY.getFullYear()
    isBirthday = isBirthdayMonth(MY_BIRTHDATE, relativeMonthNumber)
    isPastBirthday = isBirthday and not isFutureMonth
    isFutureBirthday = isBirthday and isFutureMonth

    if notBornYet then return            State.NOT_BORN
    else if isPastBirthday then return   State.BIRTHDAY
    else if isFutureBirthday then return State.FUTURE_BIRTHDAY
    else if isFutureMonth then return    State.FUTURE
    else return                          State.PAST

isInFuture = (relativeMonthNumber, lifeYear) -> 
    if lifeYear > TODAY.getFullYear()
        return true

    if lifeYear == TODAY.getFullYear() and relativeMonthNumber >= TODAY.getMonth()
        return true

    return false

isNotBorn = (age, absoluteMonthNumber, invalidMonths) -> 
  isBirthYear = age == 0 
  isInvalidMonth = absoluteMonthNumber < invalidMonths

  return isBirthYear and isInvalidMonth

isBirthdayMonth = (birthday, currentMonth) -> currentMonth == MY_BIRTHDATE.getMonth()

getMonthsAlreadySpent = (age, birthday, today) ->

    # Months spent without the current year AND without the birth year
    inBetweenMonths = (age - 1) * 12

    # Do not count the months before the actual birth
    birthMonths = 12 - birthday.getMonth()

    # Do not count the months of the current year that has not already been spent
    currentYearMonths = today.getMonth()

    absoluteMonthNumber = birthMonths + inBetweenMonths + currentYearMonths

    console.log("I am #{age} yo, I lived #{birthMonths} months in my birth year and #{currentYearMonths} months in #{today.getFullYear()}. That's a total of #{absoluteMonthNumber} months")

    return absoluteMonthNumber

shouldCreateNewRow = (monthIndex) -> monthIndex == MONTHS_PER_ROW

getAge = (birth, today) ->
    nowyear = today.getFullYear();
    nowmonth = today.getMonth();
    nowday = today.getDate();
 
    birthyear = birth.getFullYear();
    birthmonth = birth.getMonth();
    birthday = birth.getDate();
 
    age = nowyear - birthyear;
    age_month = nowmonth - birthmonth;

    if nowyear == birthyear and nowmonth == birthmonth
        age = 0
    else if age_month < 0
        age--
    
    return age

main()