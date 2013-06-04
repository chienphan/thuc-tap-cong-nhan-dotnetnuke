﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.233
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DNN.Modules.DepartmentsPage.Components
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="gobom")]
	public partial class DepartmentsDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void Insertgobom_Department(gobom_Department instance);
    partial void Updategobom_Department(gobom_Department instance);
    partial void Deletegobom_Department(gobom_Department instance);
    #endregion
		
		public DepartmentsDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["gobomConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public DepartmentsDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DepartmentsDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DepartmentsDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DepartmentsDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<gobom_Department> gobom_Departments
		{
			get
			{
				return this.GetTable<gobom_Department>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.[gobom.Departments]")]
	public partial class gobom_Department : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private string _Title;
		
		private string _Contents;
		
		private string _DateCreate;
		
		private string _DateModified;
		
		private string _Poster;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnTitleChanging(string value);
    partial void OnTitleChanged();
    partial void OnContentsChanging(string value);
    partial void OnContentsChanged();
    partial void OnDateCreateChanging(string value);
    partial void OnDateCreateChanged();
    partial void OnDateModifiedChanging(string value);
    partial void OnDateModifiedChanged();
    partial void OnPosterChanging(string value);
    partial void OnPosterChanged();
    #endregion
		
		public gobom_Department()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Title", DbType="NText NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string Title
		{
			get
			{
				return this._Title;
			}
			set
			{
				if ((this._Title != value))
				{
					this.OnTitleChanging(value);
					this.SendPropertyChanging();
					this._Title = value;
					this.SendPropertyChanged("Title");
					this.OnTitleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Contents", DbType="NText NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string Contents
		{
			get
			{
				return this._Contents;
			}
			set
			{
				if ((this._Contents != value))
				{
					this.OnContentsChanging(value);
					this.SendPropertyChanging();
					this._Contents = value;
					this.SendPropertyChanged("Contents");
					this.OnContentsChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DateCreate", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string DateCreate
		{
			get
			{
				return this._DateCreate;
			}
			set
			{
				if ((this._DateCreate != value))
				{
					this.OnDateCreateChanging(value);
					this.SendPropertyChanging();
					this._DateCreate = value;
					this.SendPropertyChanged("DateCreate");
					this.OnDateCreateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DateModified", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string DateModified
		{
			get
			{
				return this._DateModified;
			}
			set
			{
				if ((this._DateModified != value))
				{
					this.OnDateModifiedChanging(value);
					this.SendPropertyChanging();
					this._DateModified = value;
					this.SendPropertyChanged("DateModified");
					this.OnDateModifiedChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Poster", DbType="NText NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public string Poster
		{
			get
			{
				return this._Poster;
			}
			set
			{
				if ((this._Poster != value))
				{
					this.OnPosterChanging(value);
					this.SendPropertyChanging();
					this._Poster = value;
					this.SendPropertyChanged("Poster");
					this.OnPosterChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
