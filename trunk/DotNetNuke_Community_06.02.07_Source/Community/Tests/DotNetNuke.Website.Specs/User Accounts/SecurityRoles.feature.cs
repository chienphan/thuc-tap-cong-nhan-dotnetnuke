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
namespace DotNetNuke.Website.Specs.UserAccounts
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "1.8.1.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("Security Roles")]
    public partial class SecurityRolesFeature
    {
        
        private static TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "SecurityRoles.feature"
#line hidden
        
        [NUnit.Framework.TestFixtureSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "Security Roles", "In order to use security roles\r\nAs an admin\r\nI want to be use security roles UI c" +
                    "orrectly", ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.DescriptionAttribute("ManageUsers button shouldn\'t visible when the role is not approved")]
        [NUnit.Framework.CategoryAttribute("MustBeDefaultAdminCredentials")]
        public virtual void ManageUsersButtonShouldnTVisibleWhenTheRoleIsNotApproved()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("ManageUsers button shouldn\'t visible when the role is not approved", new string[] {
                        "MustBeDefaultAdminCredentials"});
#line 7
this.ScenarioSetup(scenarioInfo);
#line 8
 testRunner.Given("I am on the site home page");
#line 9
 testRunner.And("I have logged in as the admin");
#line 10
 testRunner.When("I am on the Admin Page Security Roles");
#line 11
 testRunner.And("I click edit button of role Unverified Users");
#line 12
 testRunner.And("I set role\'s status to Disabled");
#line 13
 testRunner.And("I click Update button");
#line 14
 testRunner.And("I click edit button of role Unverified Users");
#line 15
 testRunner.Then("I shouldn\'t see \"Manage Users in this Role\" button");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion
