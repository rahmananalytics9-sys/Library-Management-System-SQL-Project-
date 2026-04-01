# Library-Management-System-SQL-Project-
This project is a Library Management System built using MySQL Workbench. It demonstrates SQL concepts including:
•	SELECT queries
•	Filtering (WHERE)
•	Sorting (ORDER BY)
•	Joins
•	Aggregations
•	Subqueries
•	Window Functions
•	CASE WHEN logic
________________________________________
🗂️ Database Structure
Tables Used:
•	Books
•	Authors
•	Members
•	Issues
________________________________________
🔍 Key SQL Operations Covered
📖 Basic Queries
•	Display all books
•	Show book title and price
•	Filter books by price
•	Sort books by price
👥 Member Queries
•	Members from a specific city
•	Members joined after a date
📊 Aggregate Functions
•	Total number of books
•	Average price
•	Highest & lowest price
•	Books per category
🔗 Joins
•	Books with authors
•	Issued books with member names
❓ Subqueries
•	Members who issued books
•	Authors who have written books
🧠 Business Logic
•	Categorizing books using CASE WHEN
📈 Advanced Queries
•	Ranking books by price
•	Most popular author
•	Books not returned
•	Books never issued
________________________________________
📊 Dashboard Insights
This project can be extended into a dashboard with insights like:
•	Total books and average price
•	Most popular author
•	Issued vs non-issued books
•	Books not returned
•	Category distribution
•	Monthly issue trends
________________________________________
🛠️ Tools Used
•	MySQL Workbench
•	SQL
________________________________________
🚀 How to Run
1.	Open MySQL Workbench
2.	Create database and tables
3.	Insert sample data
4.	Run SQL queries
________________________________________
📌 Learning Outcomes
•	Strong understanding of SQL queries
•	Hands-on experience with joins and subqueries
•	Real-world data analysis skills
•	Dashboard thinking approach

10 Dashboard Insights (Based on Your Queries)
You can visualize these in Power BI / Tableau / Excel dashboards:
1. 📚 Total Books in Library
•	From Query 10
•	KPI card showing total inventory
________________________________________
2. 💰 Average Book Price
•	From Query 11
•	Helps understand pricing trend of collection
________________________________________
3. 📈 Price Distribution (Low / Medium / High)
•	From Query 23 (CASE WHEN)
•	Example:
o	Low: < 200
o	Medium: 200–400
o	High: > 400
•	Visual: Pie chart
________________________________________
4. 🏷️ Books by Category
•	From Query 13
•	Visual: Bar chart (Fantasy, Romance, etc.)
________________________________________
5. 🔥 Most Popular Author
•	From Query 26
•	Based on number of times books issued
•	Visual: Top 5 authors
________________________________________
6. 📖 Issued vs Not Issued Books
•	From Query 18
•	Helps identify unused inventory
•	Visual: Donut chart
________________________________________
7. ⏳ Books Not Yet Returned
•	From Query 8 & 31
•	Important operational metric
•	Visual: Table with:
o	Book name
o	Member name
o	Issue date
________________________________________
8. 🏙️ Members by City
•	From Query 15
•	Identify high user concentration
•	Visual: Map / bar chart
________________________________________
9. 📅 Monthly Issue Trend
•	From Query 25 (books issued in May)
•	Extend to all months
•	Visual: Line chart
________________________________________
10. 🏆 Top Expensive Books
•	From Query 27 (ranking)
•	Visual: Ranked list (Top 10 books by price)

