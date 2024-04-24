% Define keywords related to stocks, prices, and sales
stock_keywords(['stock', 'inventory', 'shares', 'equity']).
price_keywords(['price', 'cost', 'value', 'rate']).
sales_keywords(['sales', 'revenue','transactions', 'orders', 'QuantitySold']).


% example table structures
table(itemstock, [id, item_name, stock]).
table(itemprice, [id, price]).
table(itemsales, [saleid, id, quantitysold, saledate]).

% Predicate to check if a table is related to stocks
is_stock_table(TableName) :-
    table(TableName, Columns),
    stock_keywords(Keywords),
    at_least_one_keyword_in_column(Keywords, Columns).

% Predicate to check if a table is related to prices
is_price_table(TableName) :-
    table(TableName, Columns),
    price_keywords(Keywords),
    at_least_one_keyword_in_column(Keywords, Columns).

% Predicate to check if a table is related to sales
is_sales_table(TableName) :-
    table(TableName, Columns),
    sales_keywords(Keywords),
    at_least_one_keyword_in_column(Keywords, Columns).

% Define a predicate to check if at least one keyword in an array is included in the list of column names, ignoring case
at_least_one_keyword_in_column(Keywords, ColumnNames) :-
    maplist(atom_lower_case, Keywords, LowercaseKeywords),
    maplist(atom_lower_case, ColumnNames, LowercaseColumnNames),
    member(Keyword, LowercaseKeywords),
    member(Keyword, LowercaseColumnNames).

% Convert atom to lowercase
atom_lower_case(Atom, LowercaseAtom) :-
    atom_string(Atom, String),
    string_lower(String, LowercaseString),
    atom_string(LowercaseAtom, LowercaseString).

