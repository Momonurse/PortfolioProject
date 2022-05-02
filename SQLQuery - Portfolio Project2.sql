--Select*
--From [PortfolioProject].dbo.CovidDeaths
--Where continent is not null
--Order By 3,4

--Select*
--From [Portfolio Project].dbo.[CovidVaccinations ]
--Order By 3,4

--- Total Deaths vs Total Cases
---Percentage of Individuals Dying from covide if contracted

Select location,date,total_cases,total_deaths, cast(round(total_deaths/total_cases,2)  *100 as numeric(36,2)) as DeathPercentage
From [PortfolioProject].dbo.CovidDeaths
Where location like '%states%' or location like '%Antigua%' or Location like '%Guyana%'
Order By 1,2

-----Total cases vs Population
-----Percentage of Population Infected

Select location,date,population, total_cases,total_deaths, cast(round(total_cases/population,8)*100 as numeric (36,8))as PercentagePopulationInfected
From [PortfolioProject].dbo.CovidDeaths
Where location like '%States%'
Order By 1,2

-----Countries with highest infection rate compared to population

Select location,population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentagePopulationInfected
From [PortfolioProject].dbo.CovidDeaths
--Where location like '%States%'
Group By location,population
Order By PercentagePopulationInfected Desc

-----Countries with highest death count per Population

Select location, MAX(Total_deaths) as TotalDeathCount
From [PortfolioProject].dbo.CovidDeaths
--Where location like '%States%'
Where continent is not null
Group By location,population
Order By TotalDeathCount Desc


-----Death Rate By Continent 

Select continent, MAX(Total_deaths) as TotalDeathCount
From [PortfolioProject].dbo.CovidDeaths
--Where location like '%States%'
Where continent is not null
Group By continent
Order By TotalDeathCount Desc

-----Global Numbers

Select SUM(new_cases) as Total_Cases,SUM(new_deaths) as Total_Deaths,
		(SUM(new_deaths)/SUM(new_cases))*100 as DeathPercentage
From [PortfolioProject].dbo.CovidDeaths
--Where location like '%states%'
Where continent is not null
Group By date
Order By 1,2








