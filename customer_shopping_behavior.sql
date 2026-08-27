select * from customer limit 20;

--Q1. Tổng doanh thu được tạo ra từ khách hàng nam so với khách hàng nữ là bao nhiêu?
select gender, sum(purchase_amount) as revenue from customer
group by gender;

--Q2. Những khách hàng nào đã sử dụng mã giảm giá nhưng vẫn chi tiêu nhiều hơn số tiền mua hàng trung bình?
select customer_id, purchase_amount from customer
where discount_applied = 'Yes' and purchase_amount >= (select avg(purchase_amount) from customer);

--Q3. Top 5 sản phẩm có điểm đánh giá trung bình cao nhất là những sản phẩm nào?
select item_purchased, round(avg(review_rating::numeric), 2) as "Average Product" from customer
group by item_purchased
order by avg(review_rating) desc
limit 5;


--Q4. So sánh số tiền mua hàng trung bình giữa hình thức vận chuyển Standard và Express.
select shipping_type, round(avg(purchase_amount), 2) from customer
where shipping_type in ('Standard', 'Express')
group by shipping_type;


--Q5. Khách hàng đã đăng ký có chi tiêu nhiều hơn không? So sánh mức chi tiêu trung bình và tổng doanh thu
--giữa khách hàng đã đăng ký và chưa đăng ký.
select subscription_status, count(customer_id) as total_customers, round(avg(purchase_amount), 2) as avg_spend,
round(sum(purchase_amount), 2) as total_revenue from customer
group by subscription_status
order by total_revenue, avg_spend desc;

--Q6. 5 sản phẩm nào có tỷ lệ đơn hàng được áp dụng giảm giá cao nhất?
select item_purchased, 
round(100 * sum(case when discount_applied = 'Yes' then 1 else 0 end)/count(*), 2) as discount_rate from customer
group by item_purchased
order by discount_rate desc
limit 5;


--Q7. Phân loại khách hàng thành New, Returning và Loyal dựa trên tổng số lần mua hàng trước đó,
--và hiển thị số lượng khách hàng trong mỗi nhóm.
with customer_type as (
select customer_id, previous_purchases,
case
	when previous_purchases = 1 then 'New'
	when previous_purchases between 2 and 10 then 'Returning'
	else 'Loyal'
end as customer_segment
from customer
)

select customer_segment, count(*) as "Number of customers"
from customer_type
group by customer_segment;

--Q8. 3 sản phẩm được mua nhiều nhất trong mỗi danh mục là những sản phẩm nào?
with item_counts as(
select category, item_purchased, count(customer_id) as total_orders,
row_number() over(partition by category order by count(customer_id) desc) as item_rank
from customer
group by category, item_purchased
)

select item_rank, category, total_orders, item_purchased from item_counts
where item_rank <= 3;

--Q9. Những khách hàng mua lại (có hơn 5 lần mua hàng trước đó) có khả năng đăng ký dịch vụ cao hơn không?
select subscription_status, count(customer_id) as repeat_buyers from customer
where previous_purchases > 5
group by subscription_status;

--Q10. Mỗi nhóm tuổi đóng góp bao nhiêu vào tổng doanh thu?
select age_group, sum(purchase_amount) as total_revenue from customer
group by age_group
order by total_revenue desc;