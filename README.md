# 📊 Phân Tích Hành Vi Mua Sắm Của Khách Hàng

## 1. Tổng Quan Dự Án

Dự án phân tích hành vi mua sắm của khách hàng dựa trên **3.900 giao dịch** thuộc nhiều danh mục sản phẩm.

Mục tiêu của dự án là khám phá:

* Xu hướng chi tiêu của khách hàng
* Phân khúc khách hàng
* Sở thích và mức độ đánh giá sản phẩm
* Hành vi sử dụng mã giảm giá
* Hành vi đăng ký thành viên
* Hình thức vận chuyển
* Các yếu tố có thể hỗ trợ quyết định kinh doanh

Dự án thực hiện theo quy trình phân tích dữ liệu từ đầu đến cuối:

**Python → EDA & Data Cleaning → PostgreSQL → SQL Analysis → Power BI → Report → Presentation**

---

## 2. Dataset

Bộ dữ liệu gồm:

* **3.900 dòng**
* **18 cột**
* Dữ liệu về nhân khẩu học, thông tin mua hàng và hành vi giao dịch của khách hàng.

### Các nhóm dữ liệu chính

**Thông tin khách hàng**

* Age
* Gender
* Location
* Subscription Status

**Thông tin mua hàng**

* Item Purchased
* Category
* Purchase Amount
* Season
* Size
* Color

**Hành vi mua sắm**

* Discount Applied
* Previous Purchases
* Purchase Frequency
* Review Rating
* Shipping Type

### Chất lượng dữ liệu

Phát hiện **37 giá trị thiếu** trong cột `review_rating`.

Các giá trị thiếu được xử lý bằng **median của từng danh mục sản phẩm**.

---

## 3. Công Cụ Sử Dụng

| Công cụ                  | Mục đích                                        |
| ------------------------ | ----------------------------------------------- |
| **Python**               | EDA và Data Cleaning                            |
| **Pandas**               | Xử lý và biến đổi dữ liệu                       |
| **PostgreSQL**           | Lưu trữ và phân tích dữ liệu bằng SQL           |
| **MySQL**                | Thực hành và kiểm tra truy vấn SQL              |
| **SQL Server**           | Thực hành truy vấn SQL                          |
| **SQL**                  | Phân tích dữ liệu và trả lời câu hỏi kinh doanh |
| **Power BI**             | Xây dựng Dashboard                              |
| **Microsoft Word / PDF** | Xây dựng báo cáo                                |
| **Gamma**                | Thiết kế Presentation                           |
| **Jupyter Notebook**     | Thực hiện phân tích Python                      |

> Trong pipeline chính của dự án, dữ liệu sau khi làm sạch được nạp vào **PostgreSQL** để thực hiện phân tích SQL.

---

## 4. Quy Trình Thực Hiện

### Bước 1 — Load Dataset bằng Python

Sử dụng Pandas để đọc dataset và kiểm tra dữ liệu ban đầu.

Các thao tác chính:

* Đọc dữ liệu
* Kiểm tra số dòng và số cột
* Kiểm tra kiểu dữ liệu
* Kiểm tra giá trị thiếu
* Sử dụng `df.info()` để kiểm tra cấu trúc
* Sử dụng `df.describe()` để xem thống kê tổng quan

---

### Bước 2 — Exploratory Data Analysis (EDA)

Thực hiện khám phá dữ liệu để hiểu:

* Phân bố khách hàng
* Hành vi mua hàng
* Mức chi tiêu
* Đánh giá sản phẩm
* Hành vi sử dụng discount
* Tình trạng đăng ký membership
* Hình thức vận chuyển

EDA giúp xác định các vấn đề dữ liệu và định hướng các câu hỏi cần phân tích bằng SQL.

---

### Bước 3 — Data Cleaning

Các bước làm sạch dữ liệu:

* Kiểm tra missing values
* Xử lý 37 giá trị thiếu trong `review_rating`
* Chuẩn hóa tên cột sang `snake_case`
* Tạo cột `age_group`
* Tạo cột `purchase_frequency_days`
* Kiểm tra sự trùng lặp thông tin giữa `discount_applied` và `promo_code_used`
* Loại bỏ cột `promo_code_used` do thông tin trùng lặp

---

### Bước 4 — Load Dữ Liệu vào PostgreSQL

Sau khi hoàn thành Data Cleaning, DataFrame được kết nối và nạp vào PostgreSQL.

PostgreSQL được sử dụng làm cơ sở dữ liệu để thực hiện các truy vấn phân tích và trả lời các câu hỏi kinh doanh.

---

### Bước 5 — Phân Tích Bằng SQL

Dự án sử dụng SQL để trả lời **10 câu hỏi kinh doanh chính**:

1. Doanh thu theo giới tính
2. Khách hàng chi tiêu cao có sử dụng giảm giá hay không
3. Top 5 sản phẩm có đánh giá cao nhất
4. So sánh chi tiêu giữa Standard và Express Shipping
5. So sánh khách hàng đăng ký và chưa đăng ký membership
6. Top 5 sản phẩm phụ thuộc nhiều vào discount
7. Phân loại khách hàng thành New, Returning và Loyal
8. Top 3 sản phẩm trong từng danh mục
9. Mối quan hệ giữa khách hàng mua lại và đăng ký membership
10. Doanh thu theo nhóm tuổi

### Kỹ thuật SQL sử dụng

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* Aggregate Functions
* Subquery
* `CASE WHEN`
* CTE (`WITH`)
* Window Functions
* `ROW_NUMBER()`

Ví dụ, CTE và `ROW_NUMBER()` được sử dụng để xác định **Top 3 sản phẩm trong từng danh mục**.

---

## 5. Power BI Dashboard

Sau khi hoàn thành phân tích SQL, dữ liệu được sử dụng để xây dựng **Dashboard tương tác bằng Power BI** nhằm trực quan hóa các insight quan trọng.

### Dashboard tập trung vào

* Tổng quan doanh thu
* Doanh thu theo giới tính
* Membership
* Customer Segmentation
* Product Rating
* Discount Analysis
* Shipping Analysis
* Revenue theo Age Group
* Product Performance

Mục tiêu của Dashboard là giúp người dùng nhanh chóng theo dõi các chỉ số và phát hiện những xu hướng quan trọng trong hành vi khách hàng.

---

## 6. Kết Quả & Insight Chính

### 👥 Doanh thu theo giới tính

Khách hàng nam đóng góp **hơn 2/3 tổng doanh thu**, trong khi phân khúc nữ có tỷ trọng thấp hơn và có thể là cơ hội cho các chiến dịch marketing mục tiêu.

### ⭐ Top 5 sản phẩm được đánh giá cao

| Hạng | Sản phẩm | Rating |
| ---- | -------- | -----: |
| #1   | Gloves   |   3.86 |
| #2   | Sandals  |   3.84 |
| #3   | Boots    |   3.82 |
| #4   | Hat      |   3.80 |
| #5   | Skirt    |   3.78 |

### 🎟️ Tác động của Discount

SQL xác định **839 giao dịch** sử dụng discount nhưng vẫn có giá trị mua hàng cao hơn mức trung bình chung **59.76 USD**.

Điều này cho thấy discount có thể không chỉ thu hút khách hàng nhạy cảm về giá mà còn hỗ trợ tăng giá trị đơn hàng.

### 🚚 Shipping

Khách hàng sử dụng Express Shipping có mức chi tiêu trung bình cao hơn Standard:

| Hình thức | Chi tiêu trung bình |
| --------- | ------------------: |
| Express   |       **60.48 USD** |
| Standard  |       **58.46 USD** |

### 💳 Membership

Chi tiêu trung bình giữa khách hàng đăng ký và chưa đăng ký membership gần như tương đương:

* Thành viên: **59.8 USD**
* Chưa đăng ký: **59.5 USD**

Điều này cho thấy doanh nghiệp có thể cần tăng thêm các quyền lợi độc quyền để thúc đẩy tỷ lệ đăng ký.

---

## 7. Đề Xuất Kinh Doanh

Dựa trên kết quả phân tích, dự án đề xuất:

### 1. Thúc đẩy Membership

Xây dựng các quyền lợi độc quyền như:

* Miễn phí Express Shipping
* Ưu đãi dành riêng cho thành viên
* Quà tặng sinh nhật

### 2. Xây dựng Loyalty Program

Tập trung vào nhóm khách hàng có lịch sử mua hàng cao để:

* Tăng tỷ lệ quay lại
* Khuyến khích mua thêm
* Cross-selling
* Xây dựng nhóm khách hàng trung thành

### 3. Tối ưu Discount

Rà soát các sản phẩm phụ thuộc nhiều vào discount và chuyển từ giảm giá đại trà sang **discount có điều kiện** để cân bằng doanh thu và lợi nhuận.

### 4. Marketing theo phân khúc

Tập trung chiến dịch marketing vào:

* Nhóm khách hàng tiềm năng
* Nhóm tuổi có đóng góp doanh thu cao
* Các sản phẩm được đánh giá tốt
* Khách hàng có xu hướng mua lại

Các đề xuất này phù hợp với phần recommendations trong báo cáo của dự án.

---

## 8. Báo Cáo & Presentation

### Business Report

Báo cáo trình bày:

* Tổng quan dữ liệu
* Quy trình Data Cleaning
* Phân tích SQL
* Insight
* Business Recommendations

### Presentation

Presentation được xây dựng bằng **Gamma** nhằm trình bày:

* Business Problem
* Dataset
* Data Cleaning
* SQL Analysis
* Key Insights
* Business Recommendations
* Implementation Roadmap

Các đề xuất được trình bày theo hướng triển khai theo từng giai đoạn trong năm.

---

## 9. Cấu Trúc Project

```text
customer-shopping-behavior/
│
├── data/
│   └── customer_shopping_behavior.csv
│
├── notebooks/
│   └── customer_shopping_behavior.ipynb
│
├── sql/
│   └── customer_shopping_behavior.sql
│
├── powerbi/
│   └── customer_shopping_behavior_dashboard.pbix
│
├── report/
│   ├── Customer_Shopping_Behavior_Report.docx
│   └── Customer_Shopping_Behavior_Report.pdf
│
├── presentation/
│   └── customer_shopping_behavior.pptx
│
└── README.md
```

---

## 10. How to Run

### Bước 1 — Clone Repository

```bash
git clone <repository-url>
cd customer-shopping-behavior
```

### Bước 2 — Cài đặt thư viện Python

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### Bước 3 — Chạy Notebook

Mở file:

```text
notebooks/customer_shopping_behavior.ipynb
```

Chạy notebook để:

* Load dataset
* EDA
* Data Cleaning
* Feature Engineering
* Chuẩn bị dữ liệu cho SQL

### Bước 4 — Thiết lập Database

Tạo database PostgreSQL và import dữ liệu đã làm sạch.

Sau đó chạy:

```text
sql/customer_shopping_behavior.sql
```

### Bước 5 — Mở Power BI

Mở:

```text
powerbi/customer_shopping_behavior_dashboard.pbix
```

Cập nhật Database Connection nếu cần và refresh dữ liệu.

### Bước 6 — Xem Report & Presentation

Report:

```text
report/Customer_Shopping_Behavior_Report.pdf
```

Presentation:

```text
presentation/customer_shopping_behavior.pptx
```

---

## 11. Kỹ Năng Thể Hiện

Project thể hiện các kỹ năng:

* **Python / Pandas**
* **Exploratory Data Analysis**
* **Data Cleaning**
* **Feature Engineering**
* **SQL**
* **PostgreSQL**
* **CTE & Window Functions**
* **Customer Segmentation**
* **Business Analysis**
* **Power BI**
* **Data Visualization**
* **Data Storytelling**
* **Business Reporting**
* **Presentation**

---

## 12. Kết Luận

Dự án mô phỏng một quy trình **End-to-End Data Analytics** từ dữ liệu thô đến Business Insights:

**Raw Data → Python → EDA → Data Cleaning → PostgreSQL → SQL → Power BI → Report → Presentation**

Thông qua dự án, dữ liệu giao dịch được chuyển đổi thành các insight về **khách hàng, sản phẩm, discount, membership và shipping**, từ đó đưa ra các đề xuất hỗ trợ doanh nghiệp trong việc **tăng customer retention, tối ưu promotion và cải thiện chiến lược marketing**.

---

## 📌 Project Files

* `customer_shopping_behavior.csv` — Dataset
* `customer_shopping_behavior.ipynb` — Python EDA & Data Cleaning
* `customer_shopping_behavior.sql` — SQL Analysis
* `customer_shopping_behavior_dashboard.pbix` — Power BI Dashboard
* `Customer_Shopping_Behavior_Report.pdf` — Business Report
* `customer_shopping_behavior.pptx` — Project Presentation
