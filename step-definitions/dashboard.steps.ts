import { Given, When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import DashboardPage from '../pages/Dashboard'; 
import CreatePost from '../pages/CreatePost';

let dashboardPage: DashboardPage;
let createPage: CreatePost;

Given('Je suis sur le dashboard', async function () {
    dashboardPage = new DashboardPage(this.page); 
    const isDashboardVisible = await dashboardPage.page.isVisible('#site-name');
    expect(isDashboardVisible).toBe(true);
});

When('je clique sur le bouton add post', async function () {
    await dashboardPage.clickCreatePostButton();
});

Then('je suis redirige vers la page de creation de post', async function () {
    createPage = new CreatePost(this.page);
    await expect(await createPage.getPageIdentifier()).toContain("Save");
});
