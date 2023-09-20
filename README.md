# Fail Over Clusters Care Scripts

A collection of scripts designed to manage and maintain Windows Fail-Over Clusters efficiently.

## Description

This repository contains scripts to help with common cluster maintenance tasks, such as pausing a node, draining its roles, resuming a node, and performing an immediate failback.

## Scripts

1. **Drain and Pause**: Pauses a specified node and drains its roles.
2. **Resume and Failback**: Resumes a paused node and moves its roles back with immediate failback.

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/AlteredAdmin/Fail-Over-Clusters-Care-Scripts.git
   ```

2. Navigate to the repository's directory:
   ```bash
   cd Fail-Over-Clusters-Care-Scripts
   ```

## Usage

### Drain and Pause
To pause a node and drain its roles:
```bash
./DrainAndPause.ps1
```

### Resume and Failback
To resume a paused node and perform immediate failback:
```bash
./ResumeAndFailback.ps1
```

## Logging

Logs are automatically saved in the `C:\ClusterMaintenance` directory with a daily timestamp.
