electron = require 'electron'
$ = require 'jquery'
webdriver = require 'selenium-webdriver'
By = webdriver.By
LocalStorage = require('node-localstorage').LocalStorage
localStorage = new LocalStorage('./scratch')

$(document).ready ->
   $('input#id').val(localStorage.getItem('id'))
   $('input#password').val(localStorage.getItem('password'))

$('.attend').click ->
  driver = new Attend()
  driver.attend()

$('.leave').click ->
  driver = new Attend()
  driver.leave()

class Attend
  common: ->
    id = $('input#id').val()
    password = $('input#password').val()
    localStorage.setItem('id', id)
    localStorage.setItem('password', password)
    @driver = new webdriver.Builder().forBrowser('chrome').build()
    @driver.get('https://www1.shalom-house.jp/komon/login.aspx')
    @driver.findElement(By.id('txtID')).sendKeys(localStorage.getItem('id'))
    @driver.findElement(By.id('txtPsw')).sendKeys(localStorage.getItem('password'))
    @driver.findElement(By.id('btnLogin')).click()
    @driver.findElement(By.id('ctl00_ContentPlaceHolder1_imgBtnSyuugyou')).click()
  attend: ->
    @common()
    @driver.findElement(By.id('ctl00_ContentPlaceHolder1_ibtnIn3')).click()
    @driver.quit()
  leave: ->
    @common()
    @driver.findElement(By.id('ctl00_ContentPlaceHolder1_imgOut3')).click()
    @driver.quit()
