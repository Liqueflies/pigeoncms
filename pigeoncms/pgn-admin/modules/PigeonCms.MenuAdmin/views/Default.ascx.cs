using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Caching;
using System.Collections.Generic;
using PigeonCms;

public partial class Controls_MenuAdmin : PigeonCms.BaseModuleControl
{
    private enum GridCol
    {
        Sel = 0,
        ModuleContent = 3
    }

    private bool allowEditContentUrl = true;
    public bool AllowEditContentUrl
    {
        get { return GetBoolParam("AllowEditContentUrl", allowEditContentUrl); }
    }


    protected new void Page_Init(object sender, EventArgs e)
    {
        base.Page_Init(sender, e);

        Grid1.Columns[(int)GridCol.ModuleContent].Visible = this.AllowEditContentUrl;

        foreach (KeyValuePair<string, string> item in Config.CultureList)
        {
            //title
            Panel pan1 = new Panel();
            pan1.CssClass = "form-group input-group";
            PanelTitle.Controls.Add(pan1);

            TextBox txt1 = new TextBox();
            txt1.ID = "TxtTitle" + item.Value;
            txt1.MaxLength = 50;
            txt1.ToolTip = item.Key;
            txt1.CssClass = "form-control";
            txt1.Attributes.Add("onfocus", "preloadTitle('" + TxtName.ClientID + "', this)");
            pan1.Controls.Add(txt1);
            Literal lit1 = new Literal();
            lit1.Text = "<span class='input-group-addon'>" + item.Value + "</span>";
            pan1.Controls.Add(lit1);

            //titlewindow
            Panel pan2 = new Panel();
            pan2.CssClass = "form-group input-group";
            PanelTitleWindow.Controls.Add(pan2);

            TextBox txt2 = new TextBox();
            txt2.ID = "TxtTitleWindow" + item.Value;
            txt2.MaxLength = 50;
            txt2.ToolTip = item.Key;
            txt2.CssClass = "form-control";
            txt2.Attributes.Add("onfocus", "preloadTitle('" + TxtName.ClientID + "', this)");
            pan2.Controls.Add(txt2);
            Literal lit2 = new Literal();
            lit2.Text = "<span class='input-group-addon'>" + item.Value + "</span>";
            pan2.Controls.Add(lit2);
        }
        TxtAlias.Attributes.Add("onfocus", "preloadAlias('" + TxtName.ClientID + "', this)");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadDropPublishedFilter();
            loadDropMasterPages();
            loadDropThemes();
            loadDropMenus();
            loadDropsModuleTypes();
            loadDropReferMenuId();
            loadDropRouteId();
        }
        else
        {
            //reload params on every postback, because cannot manage dinamically fields
            var currModule = new PigeonCms.Module();
            try
            {
                if (DropModuleTypes.SelectedValue.Split('.').Length > 1)
                {
                    currModule.ModuleNamespace = DropModuleTypes.SelectedValue.Split('.')[0];
                    currModule.ModuleName = DropModuleTypes.SelectedValue.Split('.')[1];
                }
                currModule.CurrView = DropViews.SelectedValue;
                ModuleParams1.LoadParams(currModule);
            }
            catch { }
        }
    }

    protected void DropModuleTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
        editRow(this.CurrentId, true, false, false);
    }

    protected void DropViews_SelectedIndexChanged(object sender, EventArgs e)
    {
        editRow(this.CurrentId, false, true, false);
    }

    protected void DropMenuTypesFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        Grid1.DataBind();
    }

    protected void DropModuleTypesFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        Grid1.DataBind();
    }

    protected void DropPublishedFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        Grid1.DataBind();
    }

    protected void DropMasterPageFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        Grid1.DataBind();
    }

    protected void DropNewItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        editRow(0);
    }

    protected void ObjDs1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        MenuFilter filter = new MenuFilter();

        switch (DropPublishedFilter.SelectedValue)
        {
            case "1":
                filter.Published = Utility.TristateBool.True;
                break;
            case "0":
                filter.Published = Utility.TristateBool.False;
                break;
            default:
                filter.Published = Utility.TristateBool.NotSet;
                break;
        }

        filter.ParentId = 0;

        if (DropMenuTypesFilter.SelectedValue != "")
            filter.MenuType = DropMenuTypesFilter.SelectedValue;
        if (DropMasterPageFilter.SelectedValue != "")
            filter.CurrMasterPage = DropMasterPageFilter.SelectedValue;
        if (DropModuleTypesFilter.SelectedValue != "")
            filter.ModuleFullName = DropModuleTypesFilter.SelectedValue;

        e.InputParameters["filter"] = filter;
    }

    protected void Grid1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            editRow(int.Parse(e.CommandArgument.ToString()));
        }
        if (e.CommandName == "CopyRow")
        {
            editRow(int.Parse(e.CommandArgument.ToString()), false, false, true);
        }
        if (e.CommandName == "DeleteRow")
        {
            deleteRow(int.Parse(e.CommandArgument.ToString()));
        }
        //Visible
        if (e.CommandName == "ImgVisibleOk")
        {
            setFlag(Convert.ToInt32(e.CommandArgument), false, "visible");
            Grid1.DataBind();
        }
        if (e.CommandName == "ImgVisibleKo")
        {
            setFlag(Convert.ToInt32(e.CommandArgument), true, "visible");
            Grid1.DataBind();
        }
        //Published
        if (e.CommandName == "ImgPublishedOk")
        {
            setFlag(Convert.ToInt32(e.CommandArgument), false, "published");
            Grid1.DataBind();
        }
        if (e.CommandName == "ImgPublishedKo")
        {
            setFlag(Convert.ToInt32(e.CommandArgument), true, "published");
            Grid1.DataBind();
        }
        //Ordering
        if (e.CommandName == "MoveDown")
        {
            moveRecord(int.Parse(e.CommandArgument.ToString()), Database.MoveRecordDirection.Down);
        }
        if (e.CommandName == "MoveUp")
        {
            moveRecord(int.Parse(e.CommandArgument.ToString()), Database.MoveRecordDirection.Up);
        }
    }

    protected void Grid1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
            Utility.AddGlyph(Grid1, e.Row);
    }

    protected void Grid1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var linkedModule = new PigeonCms.Module();
            var item = new PigeonCms.Menu();
            item = (PigeonCms.Menu)e.Row.DataItem;

            Literal LitStyle = (Literal)e.Row.FindControl("LitStyle");
            LitStyle.Text = "";
            if (!string.IsNullOrEmpty(item.CssClass))
                LitStyle.Text += "C: " + item.CssClass + "<br />";
            if (!string.IsNullOrEmpty(item.CurrThemeStored))
                LitStyle.Text += "T: " + item.CurrThemeStored + "<br />";
            if (!string.IsNullOrEmpty(item.CurrMasterPageStored))
                LitStyle.Text += "M: " + item.CurrMasterPageStored + "<br />";


            Literal LitModuleNameDesc = (Literal)e.Row.FindControl("LitModuleNameDesc");
            switch (item.ContentType)
            {
                case MenuContentType.Module:
                    linkedModule = new ModulesManager().GetByKey(item.ModuleId);
                    LitModuleNameDesc.Text = linkedModule.ModuleFullName + "<br>"
                        + "<i>"+ linkedModule.CurrView +"</i>";
                    break;
                case MenuContentType.Url:
                    LitModuleNameDesc.Text = MenuContentType.Url.ToString();
                    break;
                case MenuContentType.Javascript:
                    LitModuleNameDesc.Text = MenuContentType.Javascript.ToString();
                    break;
                case MenuContentType.Alias:
                    LitModuleNameDesc.Text = MenuContentType.Alias.ToString();
                    break;
                default:
                    break;
            }

            LinkButton LnkSel = (LinkButton)e.Row.FindControl("LnkSel");
            LnkSel.Text = "<i class='fa fa-pgn_edit fa-fw'></i>" + Utility.Html.GetTextPreview(item.Name, 20, "");

            var LitAlias = (Literal)e.Row.FindControl("LitAlias");
            string alias = item.Alias;
            if (item.ContentType == MenuContentType.Url && !string.IsNullOrEmpty(item.Link))
            {
                alias = "<a href='" + item.Link + "' target='_blank' title='" + item.Link + "'>" +
                    item.Alias + "</a>";
            }
            LitAlias.Text = alias + "<br />" + item.RoutePattern;



            //moduleContent
            if (this.AllowEditContentUrl && linkedModule.Id > 0)
            {
                var LnkModuleContent = (HyperLink)e.Row.FindControl("LnkModuleContent");
                if (!string.IsNullOrEmpty(linkedModule.EditContentUrl))
                {
                    LnkModuleContent.Visible = true;
                    LnkModuleContent.NavigateUrl = linkedModule.EditContentUrl;
                }
            }

            var LitAccessTypeDesc = (Literal)e.Row.FindControl("LitAccessTypeDesc");
            LitAccessTypeDesc.Text = RenderAccessTypeSummary(item);

            //Visible
            if (item.Visible)
            {
                var img1 = e.Row.FindControl("ImgVisibleOk");
                img1.Visible = true;
            }
            else
            {
                var img1 = e.Row.FindControl("ImgVisibleKo");
                img1.Visible = true;
            }

            //Published
            if (item.Published)
            {
                var img1 = e.Row.FindControl("ImgPublishedOk");
                img1.Visible = true;
            }
            else
            {
                var img1 = e.Row.FindControl("ImgPublishedKo");
                img1.Visible = true;
            }

            //Use SSL
            if (item.CurrentUseSsl)
            {
                var img1 = e.Row.FindControl("ImgUseSsl");
                img1.Visible = true;
            }

            //Delete            
            if (item.IsCore)
            {
                var img1 = e.Row.FindControl("LnkDel");
                img1.Visible = false;
            }
            else
            {
                var img1 = e.Row.FindControl("LnkDel");
                img1.Visible = true;
            }
        }
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (checkForm())
        {
            if (saveForm())
                MultiView1.ActiveViewIndex = 0;
        }
    }

    protected void BtnApply_Click(object sender, EventArgs e)
    {
        if (checkForm())
        {
            saveForm();
        }
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        LitErr.Text = RenderError("");
        LitOk.Text = RenderSuccess("");
        MultiView1.ActiveViewIndex = 0;
    }

    protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
    {
        if (MultiView1.ActiveViewIndex == 0)    //list view
        {
            Utility.SetDropByValue(DropNewItem, "");  //select module
        }

        if (MultiView1.ActiveViewIndex == 1)    //edit view
        {
            DropModuleTypes.Enabled = false;
            DropViews.Enabled = false;
        }
    }

    #region private methods

    private bool checkForm()
    {
        string sErr = "";
        LitErr.Text = "";
        LitOk.Text = RenderSuccess("");
        bool res = true;

        if (!string.IsNullOrEmpty(TxtAlias.Text))
        {
            var filter = new MenuFilter();
            var list = new List<PigeonCms.Menu>();

            filter.Alias = TxtAlias.Text;
            filter.RouteId = int.Parse(DropRouteId.SelectedValue);
            list = new MenuManager().GetByFilter(filter, "");
            if (list.Count > 0)
            {
                string aliasInUseMessage = "alias in use for current route pattern<br />";
                if (this.CurrentId == 0)
                {
                    res = false;
                    sErr += aliasInUseMessage;
                }
                else
                {
                    if (list[0].Id != this.CurrentId)
                    {
                        res = false;
                        sErr += aliasInUseMessage;
                    }
                }
            }
        }
        else if (TxtAlias.Enabled)
            res = false;

        //check parentId
        int parentId = 0;
        foreach (ListItem item in ListParentId.Items)
        {
            if (item.Selected)
            {
                if (int.TryParse(item.Value, out parentId))
                {
                    if (parentId > 0)
                    {
                        if (parentId == this.CurrentId)
                        {
                            res = false;
                            sErr += "invalid parent ID<br />";
                        }
                    }
                }
            }
        }
        LitErr.Text = RenderError(sErr);

        return res;
    }

    private bool saveForm()
    {
        bool res = false;
        LitErr.Text = RenderError("");
        LitOk.Text = RenderSuccess("");

        try
        {
            var o1 = new PigeonCms.Menu();
            var currModule = new Module();

            //save menu
            if (base.CurrentId == 0)
            {
                form2obj(o1);
                o1 = new MenuManager().Insert(o1);

            }
            else
            {
                o1 = new MenuManager().GetByKey(base.CurrentId);
                form2obj(o1);
                new MenuManager().Update(o1);
            }

            //save module
            if (o1.ContentType == MenuContentType.Module)
            {
                if (form2module(o1, currModule))
                {
                    if (o1.ModuleId > 0)
                    {
                        currModule = new ModulesManager().GetByKey(o1.ModuleId);
                    }
                    if (currModule.Id > 0)
                    {
                        form2module(o1, currModule);
                        new ModulesManager().Update(currModule);
                    }
                    else
                    {
                        currModule = new ModulesManager().Insert(currModule);
                        o1.ModuleId = currModule.Id;
                        new MenuManager().Update(o1);
                    }
                }
            }
            else if (o1.ModuleId > 0)
            {
                new ModulesManager().DeleteById(o1.ModuleId);
                o1.ModuleId = 0;
                new MenuManager().Update(o1);
            }

            Grid1.DataBind();
            LitOk.Text = RenderSuccess(Utility.GetLabel("RECORD_SAVED_MSG"));
            res = true;
        }
        catch (Exception e1)
        {
            LitErr.Text = RenderError(
                Utility.GetLabel("RECORD_ERR_MSG") + "<br />" + e1.ToString());
        }
        finally
        {
        }
        return res;
    }

    private void clearForm()
    {
        foreach (KeyValuePair<string, string> item in Config.CultureList)
        {
            TextBox t1 = new TextBox();
            t1 = (TextBox)PanelTitle.FindControl("TxtTitle" + item.Value);
            t1.Text = "";

            TextBox t2 = new TextBox();
            t2 = (TextBox)PanelTitleWindow.FindControl("TxtTitleWindow" + item.Value);
            t2.Text = "";
        }

        LblId.Text = "";
        LblModuleId.Text = "";
        ChkVisible.Checked = false;
        ChkPublished.Checked = true;
        ChkOverridePageTitle.Checked = false;
        ChkShowModuleTitle.Checked = false;
        ChkIsCore.Checked = false;

        TxtName.Text = "";
        TxtAlias.Text = "";
        TxtLink.Text = "";
        LitMenuType.Text = "";
        TxtCssClass.Text = "";
        //Utility.SetDropByValue(DropModuleTypes, "");
        Utility.SetDropByValue(DropCurrMasterPage, "");
        Utility.SetDropByValue(DropCurrTheme, "");
        Utility.SetDropByValue(DropRouteId, "");
        Utility.SetDropByValue(DropUseSsl, "2");

        PermissionsControl1.ClearForm();

        lockControl(TxtLink, true);
        lockControl(TxtAlias, true);
        ReqAlias.Enabled = true;
        lockControl(DropReferMenuId, true);
        lockControl(DropViews, false);
    }

    private bool form2module(PigeonCms.Menu menu, Module currModule)
    {
        bool res = true;
        int dropValue = -1;
        if (int.TryParse(DropModuleTypes.SelectedValue, out dropValue))
        {
            res = false;
        }
        else
        {
            currModule.ModuleNamespace = DropModuleTypes.SelectedItem.Text.Split('.')[0];
            currModule.ModuleName = DropModuleTypes.SelectedItem.Text.Split('.')[1];
            currModule.ModuleParams = FormBuilder.GetParamsString(currModule.ModuleType.Params, ModuleParams1);
            if (!string.IsNullOrEmpty(currModule.CurrView))
            {
                //loads current view specific params
                PigeonCms.ModuleType viewType = null;
                viewType = new ModuleTypeManager().GetByFullName(
                    currModule.ModuleFullName, currModule.CurrView.Replace(".ascx", ".xml"));
                if (viewType != null)
                    currModule.ModuleParams += "|" + FormBuilder.GetParamsString(viewType.Params, ModuleParams1);
            }


            currModule.TitleTranslations = menu.TitleTranslations;
            currModule.ShowTitle = ChkShowModuleTitle.Checked;
            currModule.TemplateBlockName = ModuleHelper.ContentTemplateBlock;
            currModule.MenuSelection = ModulesMenuSelection.MenuContent;
            currModule.CurrView = DropViews.SelectedValue;
            currModule.CssFile = ModuleParams1.CssFile;
            currModule.CssClass = ModuleParams1.CssClass;
            currModule.UseCache = ModuleParams1.UseCache;
            currModule.UseLog = ModuleParams1.UseLog;
            currModule.DirectEditMode = ModuleParams1.DirectEditMode;
            currModule.SystemMessagesTo = ModuleParams1.SystemMessagesTo;
        }
        return res;
    }

    private void form2obj(PigeonCms.Menu obj)
    {
        obj.Id = base.CurrentId;
        obj.MenuType = LitMenuType.Text;
        obj.Visible = ChkVisible.Checked;
        obj.Published = ChkPublished.Checked;
        obj.OverridePageTitle = ChkOverridePageTitle.Checked;
        obj.Name = TxtName.Text;
        obj.Alias = TxtAlias.Text;
        obj.Link = TxtLink.Text;
        obj.CssClass = TxtCssClass.Text;
        obj.CurrMasterPageStored = DropCurrMasterPage.SelectedValue;
        obj.CurrThemeStored = DropCurrTheme.SelectedValue;
        obj.IsCore = ChkIsCore.Checked;
        obj.UseSsl = (Utility.TristateBool)int.Parse(DropUseSsl.SelectedValue);
        
        PermissionsControl1.Form2obj(obj);

        //route
        obj.RouteId = 1;
        if (!string.IsNullOrEmpty(DropRouteId.SelectedValue))
        {
            obj.RouteId = int.Parse(DropRouteId.SelectedValue);
        }


        obj.TitleTranslations.Clear();
        obj.TitleWindowTranslations.Clear();
        foreach (KeyValuePair<string, string> item in Config.CultureList)
        {
            TextBox t1 = new TextBox();
            t1 = (TextBox)PanelTitle.FindControl("TxtTitle" + item.Value);
            obj.TitleTranslations.Add(item.Key, t1.Text);

            TextBox t2 = new TextBox();
            t2 = (TextBox)PanelTitleWindow.FindControl("TxtTitleWindow" + item.Value);
            obj.TitleWindowTranslations.Add(item.Key, t2.Text);
        }

        int newItemValue = -1;
        if (int.TryParse(DropModuleTypes.SelectedValue, out newItemValue))
        {
            obj.ContentType = (MenuContentType)newItemValue;
        }
        else
        {
            obj.ContentType = MenuContentType.Module;
        }

        if (base.CurrentId == 0)
        {
        }
        if (obj.ContentType == MenuContentType.Alias)
        {
            int referMenuId = 0;
            if (int.TryParse(DropReferMenuId.SelectedValue, out referMenuId))
            {
                obj.ReferMenuId = referMenuId;
            }
        }
        int parentId = 0;
        foreach (ListItem item in ListParentId.Items)
        {
            if (item.Selected)
            {
                if (int.TryParse(item.Value, out parentId))
                    obj.ParentId = parentId;
            }
        }
        obj.ParentId = parentId;
    }

    private void obj2form(PigeonCms.Menu obj, bool changeType, bool changeView)
    {
        foreach (KeyValuePair<string, string> item in Config.CultureList)
        {
            string sTitleTranslation = "";
            TextBox t1 = new TextBox();
            t1 = (TextBox)PanelTitle.FindControl("TxtTitle" + item.Value);
            obj.TitleTranslations.TryGetValue(item.Key, out sTitleTranslation);
            t1.Text = sTitleTranslation;

            string sTitleWindowTranslation = "";
            TextBox t2 = new TextBox();
            t2 = (TextBox)PanelTitleWindow.FindControl("TxtTitleWindow" + item.Value);
            obj.TitleWindowTranslations.TryGetValue(item.Key, out sTitleWindowTranslation);
            t2.Text = sTitleWindowTranslation;
        }

        LblId.Text = obj.Id.ToString();
        LblModuleId.Text = obj.ModuleId.ToString();
        //Utility.SetDropByValue(DropMenuTypes, obj.MenuType); not used, list filtered on MenuType yet
        Utility.SetDropByValue(DropReferMenuId, obj.ReferMenuId.ToString());
        ChkVisible.Checked = obj.Visible;
        ChkPublished.Checked = obj.Published;
        ChkOverridePageTitle.Checked = obj.OverridePageTitle;
        LitMenuType.Text = DropMenuTypesFilter.SelectedValue;
        ChkIsCore.Checked = obj.IsCore;

        PermissionsControl1.Obj2form(obj);

        Module currModule = new Module();
        if (obj.ContentType == MenuContentType.Module)
        {
            if (obj.ModuleId == 0 && obj.Id == 0)
            {
                if (changeType)
                {
                    currModule.ModuleNamespace = DropModuleTypes.SelectedValue.Split('.')[0];
                    currModule.ModuleName = DropModuleTypes.SelectedValue.Split('.')[1];
                }
                else
                {
                    currModule.ModuleNamespace = DropNewItem.SelectedValue.Split('.')[0];
                    currModule.ModuleName = DropNewItem.SelectedValue.Split('.')[1];
                }
            }
            else
            {
                string moduleFullName = "";
                moduleFullName = new ModulesManager().GetByKey(obj.ModuleId).ModuleFullName;
                if (!new ModuleTypeManager().Exist(moduleFullName))
                {
                    LitErr.Text = RenderError(
                        Utility.GetErrorLabel("NotInstalledModuleType", "Not installed module type"));
                    //LitModuleType.Text += "&nbsp;" + Utility.GetErrorLabel("NotInstalledModuleType", "Not installed module type");
                }
                currModule = new ModulesManager().GetByKey(obj.ModuleId);
                if (changeType)
                {
                    currModule.ModuleNamespace = DropModuleTypes.SelectedValue.Split('.')[0];
                    currModule.ModuleName = DropModuleTypes.SelectedValue.Split('.')[1];
                }
                else
                    Utility.SetDropByValue(DropModuleTypes, moduleFullName);
            }

            if (changeView)
                currModule.CurrView = DropViews.SelectedValue;
            else
            {
                loadDropViews(currModule);
                Utility.SetDropByValue(DropViews, currModule.CurrView);
            }

            ChkShowModuleTitle.Checked = currModule.ShowTitle;
            ModuleParams1.LoadParams(currModule);
        }
        else
        {
            Utility.SetDropByValue(DropModuleTypes, ((int)obj.ContentType).ToString());
            //LitModuleType.Text = obj.ContentType.ToString();
            ModuleParams1.LoadParams(currModule);   //to reset params panel
        }

        Utility.SetDropByValue(DropCurrMasterPage, obj.CurrMasterPageStored);
        Utility.SetDropByValue(DropCurrTheme, obj.CurrThemeStored);
        Utility.SetDropByValue(DropRouteId, obj.RouteId.ToString());
        Utility.SetDropByValue(DropUseSsl, ((int)obj.UseSsl).ToString());

        TxtName.Text = obj.Name;
        TxtAlias.Text = obj.Alias;
        TxtLink.Text = obj.Link;
        TxtCssClass.Text = obj.CssClass;

        //load parentId list
        MenuHelper.LoadListMenu(ListParentId, DropMenuTypesFilter.SelectedValue, base.CurrentId);
        if (obj.ParentId > 0)
            Utility.SetListBoxByValues(ListParentId, obj.ParentId);
        else
            Utility.SetListBoxByValues(ListParentId, obj.MenuType);

        //MenuContentType specific
        switch (obj.ContentType)
        {
            case MenuContentType.Module:
                lockControl(TxtLink, false); 
                lockControl(DropReferMenuId, false);
                break;
            case MenuContentType.Url:
                lockControl(TxtAlias, false); 
                ReqAlias.Enabled = false;
                lockControl(DropReferMenuId, false);
                lockControl(DropViews, false);
                break;
            case MenuContentType.Javascript:
                lockControl(TxtAlias, false);
                ReqAlias.Enabled = false;
                lockControl(DropReferMenuId, false);
                lockControl(DropViews, false);
                break;
            case MenuContentType.Alias:
                lockControl(TxtLink, false);
                lockControl(DropViews, false);
                break;
            default:
                break;
        }
        if (obj.IsCore)
            lnkchange.Visible = false;
        else
            lnkchange.Visible = true;
    }

    private void lockControl(WebControl control, bool enabled)
    {
        control.Enabled = enabled;
        if (!enabled)
        {
            if (control.CssClass.LastIndexOf(" locked") == -1)
                control.CssClass += " locked";
        }
        else
        {
            if (control.CssClass.LastIndexOf(" locked") > -1)
                control.CssClass = control.CssClass.Replace(" locked", "");
        }
    }

    private void editRow(int recordId)
    {
        editRow(recordId, false, false, false);
    }

    private void editRow(int recordId, bool changeType, bool changeView, bool copyRow)
    {
        var obj = new PigeonCms.Menu();
        LitOk.Text = RenderSuccess("");
        LitErr.Text = RenderError("");

        clearForm();
        base.CurrentId = recordId;

        DropDownList drop;
        if (changeType)
            drop = DropModuleTypes;
        else
            drop = DropNewItem;
        MenuContentType contentType = MenuContentType.Module;
        int newItemValue = -1;
        if (int.TryParse(drop.SelectedValue, out newItemValue))
        {
            //url|javascript|alias
            contentType = (MenuContentType)newItemValue;
        }

        if (base.CurrentId == 0)
        {
            obj.ContentType = contentType;
            Utility.SetDropByValue(DropModuleTypes, drop.SelectedValue);
            //LitModuleType.Text = DropNewItem.SelectedValue;
            obj2form(obj, changeType, changeView);
        }
        else
        {
            obj = new MenuManager().GetByKey(base.CurrentId);
            if (changeType)
                obj.ContentType = contentType;
            obj2form(obj, changeType, changeView);
        }
        if (copyRow)
        {
            base.CurrentId = 0;
            LblId.Text = "0";
            LblModuleId.Text = "0";
            ChkIsCore.Checked = false;
            TxtAlias.Text += "-copy";
            TxtName.Text += "-copy";
        }

        MultiView1.ActiveViewIndex = 1;
    }

    private void resetStats(string action)
    {
        LitOk.Text = RenderSuccess("");
        LitErr.Text = RenderError("");

        try
        {
            //PageStatsFilter filter = new PageStatsFilter();
            //filter.GroupName = "SchedaAgritur";
            //filter.PageId = base.CurrentId;
            //filter.Action = action;
            //PageStatsManager.ResetStatByFilter(filter);

            //getStats(base.CurrentId);
        }
        catch (Exception e1)
        {
            LitErr.Text = RenderError(e1.Message);
        }
    }

    private void deleteRow(int recordId)
    {
        LitOk.Text = RenderSuccess("");
        LitErr.Text = RenderError("");

        try
        {
            new MenuManager().DeleteById(recordId);
            base.CurrentId = 0;
        }
        catch (Exception e)
        {
            LitErr.Text = RenderError(e.Message);
        }
        Grid1.DataBind();
    }

    private void loadDropPublishedFilter()
    {
        DropPublishedFilter.Items.Clear();
        DropPublishedFilter.Items.Add(new ListItem(Utility.GetLabel("LblSelectState", "Select state"), ""));
        DropPublishedFilter.Items.Add(new ListItem("On-line", "1"));
        DropPublishedFilter.Items.Add(new ListItem("Off-line", "0"));
    }

    private void loadDropMenus()
    {
        DropMenuTypesFilter.Items.Clear();

        MenutypeFilter filter = new MenutypeFilter();
        List<Menutype> recordList = new MenutypesManager().GetByFilter(filter, "");
        foreach (Menutype record1 in recordList)
        {
            DropMenuTypesFilter.Items.Add(new ListItem(record1.MenuType, record1.MenuType));
        }
    }

    private void loadDropMasterPages()
    {
        DropMasterPageFilter.Items.Clear();
        DropCurrMasterPage.Items.Clear();

        DropMasterPageFilter.Items.Add(new ListItem(Utility.GetLabel("LblSelectMasterPage", "Select masterpage"), ""));
        DropCurrMasterPage.Items.Add(new ListItem(Utility.GetLabel("LblUseBlobal", "Use global"), ""));

        Dictionary<string, string> recordList = new MasterPagesObjManager().GetList();
        foreach (KeyValuePair<string, string> item in recordList)
        {
            DropMasterPageFilter.Items.Add(new ListItem(item.Value, item.Key));
            DropCurrMasterPage.Items.Add(new ListItem(item.Value, item.Key));
        }
    }

    private void loadDropThemes()
    {
        DropCurrTheme.Items.Clear();
        DropCurrTheme.Items.Add(new ListItem(Utility.GetLabel("LblUseBlobal", "Use global"), ""));

        Dictionary<string, string> recordList = new ThemesObjManager().GetList();
        foreach (KeyValuePair<string, string> item in recordList)
        {
            DropCurrTheme.Items.Add(new ListItem(item.Value, item.Key));
        }
    }

    private void loadDropReferMenuId()
    {
        DropReferMenuId.Items.Clear();
        DropReferMenuId.Items.Add(new ListItem(Utility.GetLabel("LblSelectMenuEntry", "Select menu entry"), ""));

        MenuFilter filter = new MenuFilter();
        filter.FilterContentType = true;
        filter.ContentType = MenuContentType.Module;    //alias only for modules
        List<PigeonCms.Menu> recordList = new MenuManager().GetByFilter(filter, "menutype, t.name");
        foreach (PigeonCms.Menu record1 in recordList)
        {
            DropReferMenuId.Items.Add(new ListItem(record1.MenuType + ">" + record1.Name, record1.Id.ToString()));
        }
    }

    private void loadDropRouteId()
    {
        DropRouteId.Items.Clear();
        //DropRouteId.Items.Add(new ListItem(Utility.GetLabel("LblSelectRoutePattern", "Select route pattern"), ""));

        MvcRoutesFilter filter = new MvcRoutesFilter();
        filter.Published = Utility.TristateBool.NotSet;
        List<MvcRoute> recordList = new MvcRoutesManager().GetByFilter(filter, "");
        foreach (MvcRoute record1 in recordList)
        {
            DropRouteId.Items.Add(new ListItem("[" + record1.Name + "] " + record1.Pattern, record1.Id.ToString()));
        }
    }

    private void loadDropViews(Module currentModule)
    {
        DropViews.Items.Clear();
        try
        {
            foreach (string item in currentModule.ModuleType.Views)
            {
                ListItem listItem = new ListItem(item, item);
                DropViews.Items.Add(listItem);
            }
        }
        catch (Exception ex)
        {
            LitErr.Text = RenderError(ex.ToString());
        }
    }

    private void loadDropsModuleTypes()
    {
        try
        {
            DropNewItem.Items.Clear();
            DropNewItem.Items.Add(new ListItem(
                PigeonCms.Utility.GetLabel("LblCreateNew", "Create new"), ""));

            DropModuleTypes.Items.Clear();

            DropModuleTypesFilter.Items.Clear();
            DropModuleTypesFilter.Items.Add(new ListItem(Utility.GetLabel("LblSelectModule", "Select module"), ""));

            //add all content type except .Module
            foreach (string item in Enum.GetNames(typeof(PigeonCms.MenuContentType)))
            {
                int value = (int)Enum.Parse(typeof(PigeonCms.MenuContentType), item);
                if (value != (int)PigeonCms.MenuContentType.Module)
                {
                    DropNewItem.Items.Add(
                        new ListItem(item, value.ToString()));
                    DropModuleTypes.Items.Add(
                        new ListItem(item, value.ToString()));
                }
            }
            //add all installed modules in list
            //ModuleTypeFilter filter = new ModuleTypeFilter();
            //List<ModuleType> recordList = new ModuleTypeManager().GetByFilter(filter, "FullName");
            Dictionary<string, string> recordList = new ModuleTypeManager(true).GetList();
            foreach (var record1 in recordList)
            {
                DropNewItem.Items.Add(
                    new ListItem(record1.Key, record1.Value));
                DropModuleTypes.Items.Add(
                    new ListItem(record1.Key, record1.Value));
                DropModuleTypesFilter.Items.Add(
                    new ListItem(record1.Key, record1.Value));

                //new ListItem(record1.FullName, record1.FullName)
            }
        }
        catch (Exception ex)
        {
            LitErr.Text = RenderError(ex.ToString());
        }
    }

    private void setFlag(int recordId, bool value, string flagName)
    {
        try
        {
            PigeonCms.Menu o1 = new PigeonCms.Menu();
            o1 = new MenuManager().GetByKey(recordId);
            switch (flagName.ToLower())
            {
                case "published":
                    o1.Published = value;
                    break;
                case "visible":
                    o1.Visible = value;
                    break;
                default:
                    break;
            }
            new MenuManager().Update(o1);
        }
        catch (Exception e1)
        {
            LitErr.Text = RenderError(
                Utility.GetLabel("RECORD_ERR_MSG") + "<br />" + e1.ToString());
        }
        finally { }
    }

    protected void moveRecord(int recordId, Database.MoveRecordDirection direction)
    {
        LitErr.Text = RenderError("");
        LitOk.Text = RenderSuccess("");

        try
        {
            new MenuManager().MoveRecord(recordId, direction);
            Grid1.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }
        catch (Exception e1)
        {
            LitErr.Text = RenderError(
                Utility.GetLabel("RECORD_ERR_MSG") + "<br />" + e1.ToString());
        }
        finally { }
    }

    #endregion
}
