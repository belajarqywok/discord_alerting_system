package com.BudgetService.Schemas;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 *  Budget Alert Schema
 */
public class BudgetAlertSchema {
    /**
     *  Constructor
     */
    private final double ZDEC = 0.0;
    private final String UNKNOWN = "Unknown";

    public BudgetAlertSchema() {
        // Budget Display Name Default
        this.budgetDisplayName = UNKNOWN;

        // Cost Amount Default
        this.costAmount = ZDEC;

        // Cost Interval Start
        this.costIntervalStart = UNKNOWN;

        // Budget Amount Default
        this.budgetAmount = ZDEC;

        // Budget Amount Type Default
        this.budgetAmountType = UNKNOWN;

        // Alert Threshold Exceeded Default
        this.alertThresholdExceeded = ZDEC;

        // Forecast Threshold Exceeded Default
        this.forecastThresholdExceeded = ZDEC;

        // Currency Code Default
        this.currencyCode = UNKNOWN;
    }

    
    /**
     *  Budget Display Name
     */
    @JsonProperty("budgetDisplayName")
    private String budgetDisplayName;

    // Budget Display Name Setter
    public void setBudgetDisplayName(String displayName) {
        this.budgetDisplayName = displayName;
    }

    // Budget Display Name Getter
    public String getBudgetDisplayName() {
        return this.budgetDisplayName;
    }


    /**
     *  Cost Amount
     */
    @JsonProperty("costAmount")
    private double costAmount;

    // Cost Amount Setter
    public void setCostAmount(double amount) {
        this.costAmount = amount;
    }

    // Cost Amount Getter
    public double getCostAmount() {
        return this.costAmount;
    }


    /**
     *  Cost Interval Start
     */
    @JsonProperty("costIntervalStart")
    private String costIntervalStart;

    // Cost Interval Start Setter
    public void setCostIntervalStart(String date) {
        this.costIntervalStart = date;
    }

    // Cost Interval Start Getter
    public String getCostIntervalStart() {
        return this.costIntervalStart;
    }


    /**
     *  Budget Amount
     */
    @JsonProperty("budgetAmount")
    private double budgetAmount;

    // Budget Amount Setter
    public void setBudgetAmount(double amount) {
        this.budgetAmount = amount;
    }

    // Budget Amount Getter
    public double getBudgetAmount() {
        return this.budgetAmount;
    }


    /**
     *  Budget Amount Type
     */
    @JsonProperty("budgetAmountType")
    private String budgetAmountType;

    // Budget Amount Type Setter
    public void setBudgetAmountType(String type) {
        this.budgetAmountType = type;
    }

    // Budget Amount Type Getter
    public String getBudgetAmountType() {
        return this.budgetAmountType;
    }


    /**
     *  Alert Threshold Exceeded
     */
    @JsonProperty("alertThresholdExceeded")
    private double alertThresholdExceeded;

    // Alert Threshold Exceeded Setter
    public void setAlertThresholdExceeded(double alertThreshold) {
        this.alertThresholdExceeded = alertThreshold;
    }

    // Alert Threshold Exceeded Getter
    public double getAlertThresholdExceeded() {
        return this.alertThresholdExceeded;
    }


    /**
     *  Forecast Threshold Exceeded
     */
    @JsonProperty("forecastThresholdExceeded")
    private double forecastThresholdExceeded;

    // Forecast Threshold Exceeded Setter
    public void setForecastThresholdExceeded(double forecastThreshold) {
        this.forecastThresholdExceeded = forecastThreshold;
    }

    // Forecast Threshold Exceeded Getter
    public double getForecastThresholdExceeded() {
        return this.forecastThresholdExceeded;
    }


    /**
     *  Currency Code
     */
    @JsonProperty("currencyCode")
    private String currencyCode;

    // Currency Code Setter
    public void setCurrencyCode(String code) {
        this.currencyCode = code;
    }

    // Currency Code Getter
    public String getCurrencyCode() {
        return this.currencyCode;
    }
}
