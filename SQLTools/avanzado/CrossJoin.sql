select * from sales.SpecialOffer
select * from sales.SpecialOfferCustomer
select * from sales.SpecialOfferReseller

select  
		A.Description,
		B.Description,
		A.DiscountPct,
	    B.DiscountPct, 
		(A.DiscountPct + B.DiscountPct)as TotalDiscount 
	from 
		sales.SpecialOfferCustomer A 
		cross join sales.SpecialOfferReseller B
		

