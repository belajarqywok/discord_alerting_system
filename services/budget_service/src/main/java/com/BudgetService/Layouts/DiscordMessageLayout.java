package com.BudgetService.Layouts;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import com.BudgetService.Schemas.BudgetAlertSchema;

/**
 *  Discord Message Layout
 */
public class DiscordMessageLayout {
    /**
     *  Main Layout
     *  @param BudgetAlertSchema schema
     *  @return
     */
    public JsonObject MainLayout(BudgetAlertSchema schema) {
        JsonObject messageLayout = new JsonObject();

        // Username
        messageLayout.addProperty(
            "username",
            System.getenv("DISCORD_BOT_NAME")
        );

        // Avatar URL
        messageLayout.addProperty(
            "avatar_url", 
            System.getenv("DISCORD_BOT_AVATAR")
        );

        // Embeds
        messageLayout.add("embeds", EmbedLayout(schema));

        return messageLayout;
    }


    /**
     *  Embed Layout
     *  @param BudgetAlertSchema schema
     *  @return
     */
    private JsonArray EmbedLayout(BudgetAlertSchema schema) {
        // Embed Layout
        JsonObject embedLayout = new JsonObject();

        // Title
        embedLayout.addProperty(
            "title",
            ":warning:  [ Budget Alert ]"
        );

        // Color
        embedLayout.addProperty("color", 14177041);

        // Description
        embedLayout.addProperty(
            "description", 

            // Budget Display Name
            String.format(
                "- **Budget Display Name**: %s\n",
                schema.getBudgetDisplayName()
            ) + 

            // Cost Amount
            String.format(
                "- **Cost Amount**: %s\n", 
                schema.getCostAmount()
            ) +

            // Cost Interval Start
            String.format(
                "- **Cost Interval Start**: %s\n",
                schema.getCostIntervalStart()
            ) +

            // Budget Amount
            String.format(
                "- **Budget Amount**: %s\n", 
                schema.getBudgetAmount()
            ) +

            // Budget Amount Type
            String.format(
                "- **Budget Amount Type**: %s\n", 
                schema.getBudgetAmountType()
            ) +

            // Alert Threshold Exceeded
            String.format(
                "- **Alert Threshold Exceeded**: %s\n", 
                schema.getAlertThresholdExceeded()
            ) +

            // Forecast Threshold Exceeded
            String.format(
                "- **Forecast Threshold Exceeded**: %s\n", 
                schema.getForecastThresholdExceeded()
            ) +

            // Currency Code
            String.format(
                "- **Currency Code**: %s\n\n", 
                schema.getCurrencyCode()
            ) +

            // Team Tag
            String.format(
                "%s",
                System.getenv("DISCORD_TEAM_TAG")
            ).replace("\\n", "\n")
        );

        JsonArray embeds = new JsonArray();
        embeds.add(embedLayout);

        return embeds;
    }
}
