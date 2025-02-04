# 🏆 Employee Productivity Management

## Intoduction
This module is part of a broader **ERP system** designed to optimize employee productivity and performance tracking.

### Features:
    - Track employee productivity and output
    - Involve employees in the evaluation process (gather feedback on potential improvements)
    - Continuous performance monitoring
    - Role-based access control (Admin, Project Manager, Employee)
    - Time tracking system (in progress)
    - Productivity dashboard
    - Task planner / Calendar / Task tracking (in progress)
    - Evaluation forms

### Advanced Features:
    - **Predictive Analytics:** AI models forecast productivity trends based on historical data, helping management anticipate periods of high or low productivity and plan resources accordingly.
    - **AI-Driven Surveys and Sentiment Analysis:** AI-powered surveys use Natural Language Processing (NLP) to analyze employee feedback. Sentiment analysis identifies trends, such as common concerns or improvement suggestions, helping managers understand employee needs.

---

## Setup  

### 1. Clone and Run the API  
    First, go to this [repository](https://github.com/salemprojetphp/ProdActiveAPIs) and get the API running.  

### 2. Prepare the Project  
    Follow these steps to set up the project:  

    1. **Create a new .NET project**  
        `mkdir your-project-directory
        cd your-project-directory
        dotnet new mvc`

    2. **Link it to this repository**  
        `git init
        git remote add origin https://github.com/salemprojetphp/ProdActive.git
        git pull origin main`

    3. **Create your database**
    
    4. **Create a .env file**
        `SENDGRID_API_KEY="your-api-key"
        CONNECTION_STRING="Server=your-connection;Database=your-db-name;Trusted_Connection=True;MultipleActiveResultSets=true"`

    5. **Install dependencies**
        `dotnet restore`
    
    6. **Make migrations**
        `dotnet ef migrations add InitialMigration
        dotnet ef database update`

    7. **Populate the database**
        Execute the [script](./script.sql).

    8. **Build the project**
        `dotnet build`

    9.  **Run the project**
        `dotnet run`


Now your project should be up and running! 🚀