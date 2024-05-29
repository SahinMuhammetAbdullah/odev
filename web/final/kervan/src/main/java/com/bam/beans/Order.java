package com.bam.beans;

import java.sql.Date;

public class Order {
    private int orderId;
    private Date orderDate;
    private Date deliveryDate;
    private double totalPrize;
    private int customerId;
    private int cargoId;
    private int[] productId;
}
