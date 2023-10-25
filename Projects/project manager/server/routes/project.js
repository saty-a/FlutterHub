const express = require('express');
const proRouter = express.Router();

const Project = require('../models/project');

proRouter.post("/api/list", async function(req, res) {
    var projects = await Project.find({ userid: req.body.userid });
    res.json(projects);
});

proRouter.post("/api/add", async function(req, res) {       
    
    await Project.deleteOne({ id: req.body.id });

    const newProj = new Project({
        id: req.body.id,
        userid: req.body.userid,
        proTitle: req.body.proTitle,
        proContent: req.body.proContent,
        proStartDate:req.body.proStartDate,
        proEndDate:req.body.proEndDate,
        managerName:req.body.managerName,
        managerEmail:req.body.managerEmail,
    });
    await newProj.save();

    const response = { message: "New Project Created! " + `id: ${req.body.id}` };
    res.json(response);

});

proRouter.post("/api/delete", async function(req, res) {
    await Project.deleteOne({ id: req.body.id });
    const response = { message: "Project Deleted! " + `id: ${req.body.id}` };
    res.json(response);
});

module.exports = proRouter;