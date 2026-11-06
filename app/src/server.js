const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
    res.send("Welcome to Ecommerce DevOps Project! Application deployed successfully on AWS ECS Fargate.");
});

app.get("/health", (req, res) => {
    res.status(200).json({
        status: "healthy",
        application: "ecommerce-devops-app"
    });
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Application running on port ${PORT}`);
});
