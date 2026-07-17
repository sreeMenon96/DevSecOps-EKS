const os = require('os');

const VERSION = "1.0.1";

const express = require('express');

const app = express();

const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get('/', (req, res) => {
    res.json({ message: "Welcome to DevSecOps Project - Release 1.0.1",
        status: "Running",
        version: VERSION,
        hostname: os.hostname(),
        });
     });

app.get("/health", (req, res) => {
    res.status(200).json({
        status: "UP"
    });
});

app.get("/version", (req, res) => {
    res.status(200).json({
        version: VERSION
    });
});

app.get("/hostname", (req, res) => {
    res.status(200).json({
        hostname: os.hostname()
    });
});

app.get('/about', (req, res) => {
    res.json({
         application: "DevSecOps Demo",
         version: VERSION,
         cloud: "AWS",
         pipeline: "Azure DevOps",
         deployment: "Helm + Kubernetes" 
        });
    });

app.listen(PORT, () => {
    console.log(`DevSecOps Demo started on port ${PORT}`);
    console.log(`Hostname: ${os.hostname()}`);
    console.log(`Version: ${VERSION}`);
});    