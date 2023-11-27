package com.BudgetService.Schemas;

import java.util.Map;

/**
 *  Message Schema
 */
public class MessageSchema {
    /**
     *  Constructor
     */
    private final String UNKNOWN = "Unknown";

    public MessageSchema() {
        // Budget Message Data Default
        this.data = UNKNOWN;

        // Budget Message ID Default
        this.messageId = UNKNOWN;

        // Budget Message Publish Time Default
        this.publishTime = UNKNOWN;
    }

    
    /**
     *  Budget Message Data
     */
    private String data;

    // Budget Message Data Setter
    public void setData(String data) {
        this.data = data;
    }

    // Budget Message Data Getter
    public String getData() {
        return this.data;
    }


    /**
     *  Budget Message Attributes
     */
    Map<String, String> attributes;

    // Budget Message Attributes Setter
    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }

    // Budget Message Attributes Getter
    public Map<String, String> getAttributes() {
        return this.attributes;
    }


    /**
     *  Budget Message ID
     */
    String messageId;

    // Budget Message ID Setter
    public void setMessageId(String id) {
        this.messageId = id;
    }

    // Budget Message ID Getter
    public String getMessageId() {
        return this.messageId;
    }


    /**
     *  Budget Message Publish Time
     */
    String publishTime;

    // Budget Message Publish Time Setter
    public void setPublishTime(String time) {
        this.publishTime = time;
    }

    // Budget Message Publish Time Getter
    public String getPublishTime() {
        return this.publishTime;
    }
}
