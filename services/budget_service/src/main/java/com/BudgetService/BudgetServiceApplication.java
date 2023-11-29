package com.BudgetService;

import java.util.Base64;
import java.io.IOException;

import okhttp3.Request;
import okhttp3.Response;
import okhttp3.MediaType;
import okhttp3.RequestBody;
import okhttp3.OkHttpClient;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.google.gson.Gson;
import com.google.cloud.functions.Context;
import com.google.cloud.functions.BackgroundFunction;

import com.BudgetService.Schemas.MessageSchema;
import com.BudgetService.Schemas.BudgetAlertSchema;
import com.BudgetService.Layouts.DiscordMessageLayout;

/**
 *  Budget Service
 */
public class BudgetServiceApplication implements BackgroundFunction<MessageSchema> {
    // log4j2
    private static final Logger log4j2 = LogManager
        .getLogger(BudgetServiceApplication.class);

    @Override
    public void accept(MessageSchema budgetMessage, Context context) {
        ObjectMapper objectMapper = new ObjectMapper();
        OkHttpClient okHttpClient = new OkHttpClient();

        try {
            // Pub/Sub Message Data
            BudgetAlertSchema pubSubMessageData = objectMapper
                .readValue(
                    Base64.getDecoder().decode(budgetMessage.getData()), 
                    BudgetAlertSchema.class
                );

            // Convert JSON Object to String
            DiscordMessageLayout messageLayout = new DiscordMessageLayout();
            String messageJsonBody = new Gson()
                .toJson(messageLayout.MainLayout(pubSubMessageData));

            // Create JSON Request Body
            RequestBody messageRequestBody = RequestBody
                .create(messageJsonBody, MediaType.parse("application/json"));

            // Push Message to Discord using webhook
            String discordWebhookEndpoint = String.format(
                "https://discord.com/api/webhooks/%s/%s",
                // Discord Webhook ID
                System.getenv("DISCORD_WEBHOOK_ID"),
                // Discord Webhook Token
                System.getenv("DISCORD_WEBHOOK_TOKEN")
            );

            Request discordWebhookRequest = new Request.Builder()
                .url(discordWebhookEndpoint)
                    .post(messageRequestBody)
                        .build();

            Response discordWebhookResponse = okHttpClient
                .newCall(discordWebhookRequest).execute();

            log4j2.info(
                String.format(
                    "httpStatusCode=%s sentRequestAtMillis=%s receivedResponseAtMillis=%s", 
                    // Status Code
                    discordWebhookResponse.code(),
                    // Sent Request At Millis
                    discordWebhookResponse.sentRequestAtMillis(),
                    // Received Response At Millis
                    discordWebhookResponse.receivedResponseAtMillis()
                )
            );

            discordWebhookResponse.close();

        } catch (Exception errorMessage) {
            errorMessage.printStackTrace();

        } finally {
            okHttpClient.dispatcher()
                .executorService()
                    .shutdown();
        }
    }

    public static void main(String[] args) {
        OkHttpClient client = new OkHttpClient();

        BudgetAlertSchema schema = new BudgetAlertSchema();
        DiscordMessageLayout layout = new DiscordMessageLayout();

        String jsonBody = new Gson()
            .toJson(layout.MainLayout(schema));

        RequestBody requestBody = RequestBody
            .create(jsonBody, MediaType.parse("application/json"));

        String discordEndpoint = String.format(
            "https://discord.com/api/webhooks/%s/%s",
            System.getenv("DISCORD_WEBHOOK_ID"),
            System.getenv("DISCORD_WEBHOOK_TOKEN")
        );

        System.out.println(discordEndpoint);

        // Create the POST request
        Request request = new Request.Builder()
            .url(discordEndpoint)
                .post(requestBody)
                    .build();

        try {
            Response response = client.newCall(request).execute();

            if (response.isSuccessful()) {
                String responseBody = response.body().string();
                System.out.println("Response: " + responseBody);
            } else {
                System.out.println("Error: " + response.code() + " " + response.message());
            }

            log4j2.info(
                String.format(
                    "statusCode=%s sentRequestAtMillis=%s receivedResponseAtMillis=%s", 
                    // Status Code
                    response.code(),
                    // Sent Request At Millis
                    response.sentRequestAtMillis(),
                    // Received Response At Millis
                    response.receivedResponseAtMillis()
                )
            );

            response.close();

        } catch (IOException errorMessage) {
            log4j2.error(errorMessage);

        } finally {
            client.dispatcher()
                .executorService()
                    .shutdown();
        }
    }
}

