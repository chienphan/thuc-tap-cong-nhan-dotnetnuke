﻿// ------------------------------------------------------------------------------
//  <auto-generated>
//      This code was generated by SpecFlow (http://www.specflow.org/).
//      SpecFlow Version:1.8.1.0
//      SpecFlow Generator Version:1.8.0.0
//      Runtime Version:4.0.30319.269
// 
//      Changes to this file may cause incorrect behavior and will be lost if
//      the code is regenerated.
//  </auto-generated>
// ------------------------------------------------------------------------------
#region Designer generated code
#pragma warning disable
namespace DotNetNuke.Website.Specs.AdminFeatures
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "1.8.1.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("Languages")]
    public partial class LanguagesFeature
    {
        
        private static TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "Languages.feature"
#line hidden
        
        [NUnit.Framework.TestFixtureSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "Languages", "In order to manage multiple languages\r\nAs an admin\r\nI want to be using features i" +
                    "n language correctly", ProgrammingLanguage.CSharp, ((string[])(null)));
            testRunner.OnFeatureStart(featureInfo);
        }
        
        [NUnit.Framework.TestFixtureTearDownAttribute()]
        public virtual void FeatureTearDown()
        {
            testRunner.OnFeatureEnd();
            testRunner = null;
        }
        
        [NUnit.Framework.SetUpAttribute()]
        public virtual void TestInitialize()
        {
        }
        
        [NUnit.Framework.TearDownAttribute()]
        public virtual void ScenarioTearDown()
        {
            testRunner.OnScenarioEnd();
        }
        
        public virtual void ScenarioSetup(TechTalk.SpecFlow.ScenarioInfo scenarioInfo)
        {
            testRunner.OnScenarioStart(scenarioInfo);
        }
        
        public virtual void ScenarioCleanup()
        {
            testRunner.CollectScenarioErrors();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("Language selector should show the correct value of current language")]
        [NUnit.Framework.CategoryAttribute("MustBeDefaultAdminCredentials")]
        public virtual void LanguageSelectorShouldShowTheCorrectValueOfCurrentLanguage()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("Language selector should show the correct value of current language", new string[] {
                        "MustBeDefaultAdminCredentials"});
#line 7
this.ScenarioSetup(scenarioInfo);
#line 8
 testRunner.Given("I am on the site home page");
#line 9
 testRunner.And("I have logged in as the host");
#line 10
 testRunner.When("I am on the Host Page Host Settings");
#line 11
 testRunner.And("I enable content localization setting");
#line 12
 testRunner.And("I am on the Admin Page Languages");
#line 13
 testRunner.And("I add new language es-ES");
#line 14
 testRunner.And("I enable content localization on the portal");
#line 15
 testRunner.And("I modify skin Home-Mega-Menu.ascx to set showMenu of Language control");
#line 16
 testRunner.And("I navigate to home page");
#line 17
 testRunner.And("I click language icon of es-ES");
#line 18
 testRunner.Then("The language drop down should also select language es-ES");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("RadEditorProvider language pack should create successful")]
        [NUnit.Framework.CategoryAttribute("MustBeDefaultAdminCredentials")]
        public virtual void RadEditorProviderLanguagePackShouldCreateSuccessful()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("RadEditorProvider language pack should create successful", new string[] {
                        "MustBeDefaultAdminCredentials"});
#line 21
this.ScenarioSetup(scenarioInfo);
#line 22
 testRunner.Given("I am on the site home page");
#line 23
 testRunner.And("I have logged in as the host");
#line 24
 testRunner.When("I am on the Admin Page Languages");
#line 25
 testRunner.And("I try to create Provider language pack of RadEditor");
#line 26
 testRunner.Then("RadEditor language pack should create successful");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion