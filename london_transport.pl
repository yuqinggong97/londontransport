/* Question 1
     station(StationName, ListOfLines)
     The fact that a station is on one or some lines.
     The relationship is written first, called "station".
     The fact consists of two objects, and they are written separately by commas, enclosed by a pair of round brackets.
     The first object is the name of the station, we use abbreviation for this object, which is given in the question,
     the second object is a list of lines that the station is on, we use [] to represent a list.
     because the example query StationName given in Question 2 on the paper is a string, i.e. ?-station_exist('WA').
     so we add single quotes to the name as well.
     Add a dot character "." at the end of a fact.
*/

% define facts: stations
% Bakerloo Line
  station('EC', [bakerloo]). 	                                    % Elephant & Castle is on Bakerloo Line. 				
  station('EM', [bakerloo, northern]). 	                            % Embankment is on Bakerloo Line and Northern Line.	
  station('OC', [bakerloo,central, victoria]). 	                    % Oxford Circus is on Bakerloo Line, Central Line and Victoria Line.		
  station('PA', [bakerloo]). 		                            % Paddington is on Bakerloo Line.			
  station('WA', [bakerloo]). 	                                    % Warwick Avenue is on Bakerloo Line.
				
% Central Line
  station('BG', [central]).	 		                    % Bethnal Green is on Central Line.			
  station('LS', [central, metropolitan]). 		            % Liverpool Street is on Central Line and Metropolitan Line.			
  station('CL', [central]). 			                    % Chancery Lane is on Central Line.		
  station('TC', [central, northern]). 		                    % Tottenham Court Road is on Central Line and Northern Line.			
  station('LG', [central]). 	                                    % Lancaster Gate is on Central Line.
  station('NH', [central]).                                         % Notting Hill Gate is on Central Line.

% Metropolitan Line
  station('AL', [metropolitan]). 		                    % Aldgate is on Metropolitan Line.
  station('KX', [metropolitan, victoria]). 		            % Kings Cross is on Metropolitan Line and Victoria Line.		
  station('BS', [metropolitan]). 		                    % Baker Street is on Metropolitan Line.		
  station('FR', [metropolitan]). 		                    % Finchley Road is on Metropolitan Line.			
	
% Northern Line
  station('KE', [northern]). 			                    % Kennington is on Northern Line.		
  station('WS', [northern, victoria]). 	                            % Warren Street is on Northern Line and Victoria Line.				
  station('EU', [northern]). 	                                    % Euston is on Northern Line.

% Victoria Line
  station('BR', [victoria]). 		                            % Brixton is on Victoria Line.
  station('VI', [victoria]). 			                    % Victoria is on Victoria Line.
  station('FP', [victoria]). 	                                    % Finsbury Park is on Victoria Line.


/* Test cases
    % station('EC',List).                                           % List = [bakerloo].
    % station(Station, [victoria]).                                 % Station = 'BR' ;     % Using ; to display multiple solutions.
                                                                      Station = 'VI' ;
                                                                      Station = 'FP'.
*/



%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- %
/* Question 2
    station_exists(Station)
    A rule to check whether a station exists.
    Consist of a head and body separated by :- 
    Head: station_exists(Station)
    Body: station(Station, ListOfLines)
    where Station is a station name.
    Make sure the station name here matches the station name in Question 1, by using Unification which is a built-in pattern. 
    A station exists if the station appears in the fact station(Station, ListOfLines) as the first object.
*/

station_exists(Station):-                                           % using unification to match the station name.
                 station(Station, ListOfLines).                     % a station exists if there is a station on one/some line(s).


/* Test cases
    % station_exists('WA').                                         % true.
    % station_exists('A').                                          % false.
    % station_exists('VI').                                         % true.
    % station_exists('YORK').                                       % false.  
*/



%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- %
/* Question 3
    adjacent(Station1, Station2)
    isadjacent(Station1, Station2): The fact that two stations have adjacent relationship. According to the map, we define the adjacent stations.
    The relationship is written first, called "isadjacent".
    The fact consists of two objects, and they are written separatey by commas, enclosed by a pair of round brackets.
    The first object Station1 is a name of a station and the second object Station2 is a name of another station.
    The names of the adjacent stations can appear in different order, for example, WA is adjacent to PA, and PA is adjacent to WA,
    so we use ; as "or" in a rule: 
    adjacent(Station1, Station2):- isadjacent(Station1, Station2); isadjacent(Station2, Station1).
    As long as one predicate is true, they are adjacent.
*/

% define facts: adjacent stations
% Bakerloo Line - the orange line on the map.
  isadjacent('WA', 'PA').                                          % WA is adjacent to PA.
  isadjacent('PA', 'OC').                                          % PA is adjacent to OC.
  isadjacent('OC', 'EM').                                          % OC is adjacent to EM.
  isadjacent('EM', 'EC').                                          % EM is adjacent to EC.

% Central Line - the red line on the map.
  isadjacent('NH', 'LG').                                          % NH is adjacent to LG.
  isadjacent('LG', 'OC').                                          % LG is adjacent to OC.
  isadjacent('OC', 'TC').                                          % OC is adjacent to TC.
  isadjacent('TC', 'CL').                                          % TC is adjacent to CL.
  isadjacent('CL', 'LS').                                          % CL is adjacent to LS.
  isadjacent('LS', 'BG').                                          % LS is adjacent to BG.

% Metropolitan Line - the purple line on the map.
  isadjacent('FR', 'BS').                                          % FR is adjacent to BS.
  isadjacent('BS', 'KX').                                          % BS is adjacent to KX.
  isadjacent('KX', 'LS').                                          % KX is adjacent to LS.
  isadjacent('LS', 'AL').                                          % LS is adjacent to AL.


% Northern Line (West End branch) - the black line on the map.
  isadjacent('EU', 'WS').                                          % EU is adjacent to WS.
  isadjacent('WS', 'TC').                                          % WS is adjacent to TC.
  isadjacent('TC', 'EM').                                          % TC is adjacent to EM.
  isadjacent('EM', 'KE').                                          % EM is adjacent to KE.

% Victoria Line - the blue line on the map.
  isadjacent('BR', 'VI').                                          % BR is adjacent to VI.
  isadjacent('VI', 'OC').                                          % VI is adjacent to OC.
  isadjacent('OC', 'WS').                                          % OC is adjacent to WS.
  isadjacent('WS', 'KX').                                          % WS is adjacent to KX.
  isadjacent('KX', 'FP').                                          % KX is adjacent to FP.

adjacent(Station1, Station2):- 
                               isadjacent(Station1, Station2);     % Two stations are adjacent if they have the fact: isadjacent(Station1, Station2).
                               isadjacent(Station2, Station1).     % Use ; as 'or' to indicate they are also adjacent if the positions of the two objects reverse, 
                                                                   % For example, adjacent(Station1, Station2) and adjacent(Station2, Station1) have the same result.


/* Test cases
    % adjacent('FP', 'KX').                                        % true.
    % adjacent('KX', 'WA').                                        % false.
*/ 


% ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- %
/* Question 4
    sameline(Station1, Station2, Line)
    A rule to check whether two stations are on the same line.
    Consist of a head and body separated by :- 
    The head is true if all predicates in the body can be proved to be true.

    Head: sameline(Station1, Station2, Line): Station1 and Station2 are on the same line if all predicates are true.
    Body:
          predicate1: station(Station1, List1): This will declare a station named Station1 is on some lines (lines are written in the List1).  
          predicate2: station(Station2, List2): This will declase a station named Station2 is on some lines (lines are written in the List2).
          predicate3: member(Line, List1): Check whether a line named Line is a member of List1.
          predicate4: member(Line, List2): Check whether this line is a member of List2 as well.

    If all the predicates are true, this means Station1 and Station2 run through (a) common line(s), 
    In other word, they are on the same line, which will return the lines.
    Otherwise return false.   
*/

sameline(Station1, Station2, Line):- 
                           station(Station1, List1),              % predicate1: Declares Station1 and List1.
                           station(Station2, List2),              % predicate2: Declares Station2 and List2.
                           member(Line, List1),                   % predicate3: Checks if Line is a member of List1.
                           member(Line, List2).                   % predicate4: Checks if Line is a member of List2.


/* Test cases
    % sameline('WA', 'EC', Line).                                 % Line = bakerloo.
    % sameline('FP', 'KE', Line).                                 % false.
    % sameline('WS', 'AL', Line).                                 % false.			
*/



% ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- %
/* Question 5
    line(Line, ListOfStations)
    A rule to find all stations that are on a particular line.

    Head: line(Line, ListOfStations): The first object Line is a name of a line, which is the particular line.
    the second object ListOfStations is a list of stations that are on this line. 

    Body: findall(Station, (station(Station, List), member(Line, List)), ListOfStations).

    In the body, we use findall, a built-in fuction (rule):
    findall(X, Y, Z): where X is the item being collect; 
                            Y is the condition;
                            Z is the result.
    X: We are collecting the names of all stations that are on a particular line, therefore here X is Station: Station is being collected.
    Y: 
        condition1: station(Station, List): We need to list all the stations and lists, using unification to match station name which is Station in X.
        condition2: member(Line, List): Those stations should be on a particular line, therefore, we need to satisfy the condition that the list should contain that line.
        We use built-in function member(Line, List) to restrict the condition that Line is a member of a list. 
    Z: All stations found will be return in a list, i.e. ListOfStations from the paper.
*/


line(Line, ListOfStations):- 
                       findall(Station,                                       % Station is being collected.
                       (station(Station, List), member(Line, List)),          % The station is on some lines (written in the list), and the list should contain a particular line.
                       ListOfStations).                                       % Result.


/* Test cases
     % line(metropolitan, ListOfStations).                                    % ListOfStations = ['LS', 'AL', 'KX', 'BS', 'FR'].
     % line(victoria, ListOfStations).                                        % ListOfStations = ['OC', 'KX', 'WS', 'BR', 'VI', 'FP'].
     % line(bakerloo, ListOfStations).                                        % ListOfStations = ['EC', 'EM', 'OC', 'PA', 'WA'].
*/



% ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- %
/* Question 6
    station_numlines(Station, NumberOfLines)
    A rule to find out how many lines run through a particular station.
    Head: station_numlines(Station, NumberOfLines): The first object is the name of a station, and the second object is the number of lines.
    Body: 
         predicate1: station(Station, List)
         We use unification to match the station name with the station name in the Head and match the list of that station with the list in predicate2.
        
         predicate2: length(List, NumberOfLines)
         We use length, a built-in function:
         length(X, Y): where X is the list, the length of this list will be return in Y.
                             Y is the result, here we use NumberOfLines to return the number of lines.   
*/


station_numlines(Station, NumberOfLines):-      
                            station(Station, List),                 % predicate1: The particular station named Station is on a list of lines.
                            length(List, NumberOfLines).            % predicate2: Check the length of that List, and return it in NumberOfLines. The built-in function length is explained above.  


/* Test cases
    % station_numlines('AL', NumberOfLines).                        % NumberOfLines = 1.
    % station_numlines('OC', NumberOfLines).                        % NumberOfLines = 3.
    % station_numlines('VI', NumberOfLines).                        % NumberOfLines = 1.
*/



% ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- %
/* Question 7
     adjacent2interchange(NonInterStation, InterchangeStation)
     A rule to find stations which are adjacent to an interchange station, but are not interchange stations themselves.
     Head: adjacent2interchange(NonInterStation, InterchangeStation): The first object is a non-interchange station, the second object is interchange station, which will be returned.
     Body:
              predicate1:  station_numlines(NonInterStation, NumberOfLine), NumberOfLine is 1: 
                                 A station is non-interchange station if the number of line run through it is exactly one.

              predicate2:  station_numlines(InterchangeStation, NumberOfLines), NumberOfLines > 1:
                                 A station is an interchange station if it is on more than more lines. 

              predicate3: adjacent(NonInterStation, InterchangeStation): Once we define the interchange and non-interchange station, 
                                 We check whether the Interchange station is adjacent to the particular non-interchange station, if there is then the interchange stations will be returned. Otherwise, return false.
*/       

adjacent2interchange(NonInterStation, InterchangeStation):- 
                                station_numlines(NonInterStation, NumberOfLine), NumberOfLine == 1,          % a non-interchange station only run through one line.
                                station_numlines(InterchangeStation, NumberOfLines), NumberOfLines > 1,      % an interchange stationn run through more than more line. 
                                adjacent(NonInterStation, InterchangeStation).                               % check if the non-interchange station is adjacent to the interchange station.


/* Test cases
     % adjacent2interchange('OC', InterchangeStation).                                                       % false .   
     % adjacent2interchange('CL', InterchangeStation).                                                       % InterchangeStation = 'LS' ;   % Using ; to display multiple solutions.
                                                                                                               InterchangeStation = 'TC' ;
                                                                                                               false.  
     % adjacent2interchange('VI', InterchangeStation).                                                       % InterchangeStation = 'OC' ;
                                                                                                               false.
*/



% ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- %
/* Question 8
    route(From, To, Route)
    A rule to find any route between two stations.
    Head: route(From, To, Route): From and To are two station names. Route is a list of stations connecting the two stations (inculding the two stations themselves) in order, and it will be returned.	
*/



route(From, To, Route):-     					     % Find the route from station From to station To:	
	          travel(From, To, [From], Travel),                  % Route is returned if From and To are adjacent stations.
	          reverse(Travel, Route).                            % List Travel and list Route are in reversed order, make sure the lists of route are returned in correct order.



travel(From, To, SubTravel, [To|SubTravel]):- 	                     % Base case: A rule to find routes from station From to station To.	
	          adjacent(From, To).                                % The two stations are adjacent, return the route, which is stored in the list.
	         


travel(From, To, HasTravelled, Route):-		                     % Recursive case     % If From and To are not adjacent stations:		
	          adjacent(From, Next),                              % Find a connected station Next: The station From and station Next (which is a connected station) are adjacent.
	          Next \== To,                                       % Make sure station Next is not station To, i.e. Not the base case. 
                  \+member(Next, HasTravelled),                      % Make sure station Next is not the station we have already travelled part of the route, i.e. Next is not a member of the list HasTravelled. Otherwise it will run endlessly.
                  travel(Next, To, [Next|HasTravelled], Route).      % Recursive case: Continue to find the route starts from station Next, and finds the second 'Next' that is adjacent to the current Next. 
                                                                     % Stop when it finds a station that is adjacent to station To.




/* Test cases
    % route('TC', 'CL', Route).                                      % Route = ['TC', 'CL'] ;         % Using ; to display multiple solutions.
                                                                       Route = ['TC', 'EM', 'OC', 'WS', 'KX', 'LS', 'CL'] ;
                                                                       Route = ['TC', 'OC', 'WS', 'KX', 'LS', 'CL'] ;
                                                                       Route = ['TC', 'WS', 'KX', 'LS', 'CL'] ;
                                                                       false.

    % route('EU', 'VI', Route).                                      % Route = ['EU', 'WS', 'TC', 'EM', 'OC', 'VI'] ;
                                                                       Route = ['EU', 'WS', 'TC', 'OC', 'VI'] ;
                                                                       Route = ['EU', 'WS', 'KX', 'LS', 'CL', 'TC', 'EM', 'OC', 'VI'] ;
                                                                       Route = ['EU', 'WS', 'KX', 'LS', 'CL', 'TC', 'OC', 'VI'] ;
                                                                       Route = ['EU', 'WS', 'OC', 'VI'] ;
                                                                       false.
*/


% ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- %
/* Question 9
     A rule to find the time taken to travel on a route between two stations, time spent on adjacent stations is 4 minutes.
     Head: route_time(From, To, Route, Minutes): 
               From and To are station names, i.e. start and end stations.
               Route is a list of stations that connect them in order and will be returned, Minutes is total time spent on travelling between these two stations and will be returned.

     Body: 
              predicate1: route(From, To, Route): Using unification to match From and To with the station names in the Head. And find the travelling path lists between them. (From question 8).

              predicate2: length(Route, NumberOfStations): Find the length of each route list, i.e. how many stations travelling in total between From and To, and will be stored in NumberOfStations.

              predicate3: Minutes is (NumberOfStations -1) * 4: Time spent on adjacent stations is 4 minutes. Becuse it needs a pair of adjacent stations, i.e. two stations, to form a single path, we substract the total number of stations by 1, and mutipy by 4 to get the total time and the total time will be returned in Minutes.
*/


route_time(From, To, Route, Minutes):- 
                             route(From, To, Route),                       % predicate1
                             length(Route, NumberOfStations),              % predicate2
                             Minutes is (NumberOfStations - 1) * 4.        % predicate3




/* Test cases
    % route_time('FR', 'OC', Route, Minutes).          % Route = ['FR', 'BS', 'KX', 'LS', 'CL', 'TC', 'OC'],   % Using ; to display multiple solutions.
                                                         Minutes = 24 ;
                                                         Route = ['FR', 'BS', 'KX', 'LS', 'CL', 'TC', 'EM', 'OC'],
                                                         Minutes = 28 ;
                                                         Route = ['FR', 'BS', 'KX', 'LS', 'CL', 'TC', 'WS', 'OC'],
                                                         Minutes = 28 ;
                                                         Route = ['FR', 'BS', 'KX', 'WS', 'OC'],
                                                         Minutes = 16 ;
                                                         Route = ['FR', 'BS', 'KX', 'WS', 'TC', 'OC'],
                                                         Minutes = 20 ;
                                                         Route = ['FR', 'BS', 'KX', 'WS', 'TC', 'EM', 'OC'],
                                                         Minutes = 24 ;
                                                         false.

   % route_time('VI', 'EU', Route, Minutes).           % Route = ['VI', 'OC', 'EM', 'TC', 'CL', 'LS', 'KX', 'WS', 'EU'],
                                                         Minutes = 32 ;
                                                         Route = ['VI', 'OC', 'EM', 'TC', 'WS', 'EU'],
                                                         Minutes = 20 ;
                                                         Route = ['VI', 'OC', 'TC', 'CL', 'LS', 'KX', 'WS', 'EU'],
                                                         Minutes = 28 ;
                                                         Route = ['VI', 'OC', 'TC', 'WS', 'EU'],
                                                         Minutes = 16 ;
                                                         Route = ['VI', 'OC', 'WS', 'EU'],
                                                         Minutes = 12 ;
                                                         false.       

    % route_time('BR', 'VI', Route, Minutes).          % Route = ['BR', 'VI'],
                                                         Minutes = 4 ;
                                                         false.
*/


