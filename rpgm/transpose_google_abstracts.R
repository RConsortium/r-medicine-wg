library(tidyverse)
library(glue)
library(googlesheets4)
library(arsenal)

abstracts <- read_sheet("https://docs.google.com/spreadsheets/d/1_UEcbohXrrlqT_G-LpqKMdUpUxx9tJjsBJxbd3igAGk/edit?usp=sharing") %>% 
  slice(1:64) 
names(abstracts) <- make.names(names(abstracts))

tmp <- abstracts %>% 
  glue_data("name: {Primary.Speaker.Information...Primary.Speaker.Full.Name..}\n",
            "org: {Primary.Speaker.Information...Primary.Speaker.Company..}\n",
            "title: {Primary.Speaker.Information...Primary.Speaker.Job.Title..}\n",
            "country: {Primary.Speaker.Information...Primary.Speaker.Country.of.Residence..}\n",
            "gender: {X.primary_gender..R.Medicine.is.committed.to.a.diverse.and.inclusive.community..The.following.questions..which.are.optional..are.asked.in.an.effort.to.track.our.progress.in.increasing.diversity.at.events.and.will.remain.confidential.}\n",
            "poc: {X.primary_race.}\n",
            "bio: {Primary.Speaker.Information...Primary.Speaker.Biography..provide.a.biography.that.includes.your.employer..if.any...ongoing.projects.and.your.previous.speaking.experience...}\n\n",
            "submission_type: {Type.of.Submission.}\n",
            "abstract_title: {Abstract.Title.}\n",
            "abstract: {Abstract.}\n",
            "---------------------------------------------------------------\n\n")

sink("pretty_abstracts_2022.txt")
print(tmp)
sink()
