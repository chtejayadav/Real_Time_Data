## 📊 Smile Guru Data Analysis & Visualization

### 📝 Overview
This project focuses on analyzing and visualizing user interactions with the Smile Guru website. The dataset includes visitor behavior, device usage, event tracking, and page engagement. The analysis was performed using **SQL for data cleaning** and **Power BI for visualization**.

---

### 📂 Project Files

- **`Smile_Guru_ga4_data.csv`** – Raw Google Analytics 4 (GA4) data for Smile Guru.
- **`Smile_Guru_ga4_data.sql`** – SQL scripts used for data cleaning and preprocessing.
- **`Smile_Guru_Analysis_Detailed.pptx`** – A detailed report containing insights, visualizations, and conclusions.
- **`Smile guru visual.png`** – Power BI dashboard visualization.

---

### 🛠️ Tools Used

- **SQL (MySQL Workbench)** – Data cleaning, transformation, and preparation.
- **Power BI** – Data visualization and dashboard creation.
- **MS Excel** – Initial data exploration and formatting.

---

### 📊 Data Processing & Cleaning

1. **Data Import & Standardization**  
   - Ensured all data was imported as text to prevent misinterpretations.
   - Converted relevant fields to appropriate data types (e.g., date, integer, string).

2. **Handling Missing Values**  
   - Removed records with missing critical fields (event name, device category, page location).
   - Replaced non-critical missing values with `"Unknown"` to minimize data loss.

3. **Unique Identifiers & Event Processing**  
   - Added a **Unique ID** column for each record.
   - Converted and standardized the event date format.

4. **Final Dataset Export**  
   - Cleaned data was exported as a CSV file for further visualization.

---

### 📊 Data Visualization Insights

- **Visitor Analysis**  
  - Total **1,053** visitors recorded.
  - The **"Main"** and **"About"** pages received the most views.
  
- **User Interaction**  
  - **Page views (24.03%)** were the most frequent event.
  - **Clicks (23.55%)** and **Scrolls (22.6%)** indicate strong engagement.
  - **Form submissions (8.45%)** highlight conversion opportunities.

- **Device & OS Breakdown**  
  - **Android (28.49%)** and **Windows (28.3%)** were the most used operating systems.
  - **Mobile (29.25%)** and **Desktop (28.02%)** were the leading device categories.
  
- **Key Performance Indicators (KPIs)**  
  - **Top Click Device**: Desktop users had the highest interaction.
  - **Top Form Submission Page**: "Dental-implants" page.
  - **Most Active User ID**: `982.749.502`.

---

### 📌 Conclusion & Recommendations

✔ **Optimize Less Visited Pages**: Improve content on Orthodontics and Emergency Dental pages.  
✔ **Enhance Mobile Experience**: Since **mobile (29.25%)** and **tablet (26.02%)** usage is high, responsive design is crucial.  
✔ **Leverage High Engagement Pages**: The "Main" and "About" pages have the most traffic—utilize them for strategic content placement.  
✔ **Encourage More Form Submissions**: The "Dental-implants" page has the highest conversions; similar strategies should be applied to other pages.

---

### 📬 Contact & Contribution

Feel free to contribute by improving the SQL queries, adding new visualizations, or enhancing the Power BI dashboard.

📧 For any queries, reach out via GitHub Issues.

---
