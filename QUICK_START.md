# Kyaw Htet Portfolio Website - GitLab Quick Start Guide

## 🚀 အလျင်မြန် စတင်ခြင်း (Quick Start)

သင့် Website ကို GitLab Pages တွင် Live လွှင့်တင်ရန် အောက်ပါ အဆင့်များကို လိုက်နာပါ။

---

## ✅ အဆင့် ၁ - GitLab Project ကို ပြင်ဆင်ခြင်း

1. **GitLab Account ဖွင့်ခြင်း**
   - [https://gitlab.com](https://gitlab.com) သို့ သွားပါ
   - Sign up သို့မဟုတ် Login ဝင်ပါ

2. **Project အသစ်ပြုလုပ်ခြင်း**
   - **"New project"** ခလုတ်ကို နှိပ်ပါ
   - **"Create blank project"** ကို ရွေးချယ်ပါ
   - **Project name:** `porfolio-project` ဟု ရေးပါ
   - **Visibility:** `Public` ထားပါ
   - **"Create project"** ကို နှိပ်ပါ

---

## ✅ အဆင့် ၂ - Website ဖိုင်များကို GitLab သို့ တင်ခြင်း

### **Windows (PowerShell) အသုံးပြုသူများ**

1. `kyawhtet-website` folder ထဲသို့ ဝင်ပါ
2. Folder အတွင်း Mouse ညာဘက်နှိပ်ပြီး **"Open PowerShell here"** ကို နှိပ်ပါ
3. အောက်ပါ Command ကို ရိုက်ထည့်ပါ:
   ```powershell
   .\deploy-to-gitlab.ps1
   ```
4. GitLab Username နှင့် Password တောင်းပါက ရိုက်ထည့်ပါ

### **Mac / Linux အသုံးပြုသူများ**

Terminal ကို ဖွင့်ပြီး အောက်ပါ Commands များကို ရိုက်ထည့်ပါ:

```bash
cd /path/to/kyawhtet-website
git init
git add .
git commit -m "Initial commit: Kyaw Htet Portfolio Website"
git remote add origin https://gitlab.com/porfolio-group1/porfolio-project.git
git branch -M main
git push -u origin main
```

---

## ✅ အဆင့် ၃ - Pipeline အလုပ်လုပ်နေခြင်းကို ကြည့်ခြင်း

1. သင့် GitLab Project Page သို့ သွားပါ
2. **Build > Pipelines** ကို နှိပ်ပါ
3. Pipeline အလုပ်လုပ်နေတာကို တွေ့ရမှာဖြစ်ပါသည်
4. Status ကို **Passed** သို့ ပြောင်းသွားမည်ဖြစ်ပါသည်

---

## ✅ အဆင့် ၄ - Website Live ကြည့်ခြင်း

Pipeline အောင်မြင်စွာ ပြီးဆုံးသွားပါက သင့် Website သည် အောက်ပါ URL တွင် Live ဖြစ်သွားပါလိမ့်မည်:

```
https://porfolio-group1.gitlab.io/porfolio-project/
```

---

## 📋 အရေးကြီးသော အချက်များ

| အချက် | အသေးစိတ် |
|---|---|
| **.gitlab-ci.yml** | ဤဖိုင်သည် GitLab ကို Website အဖြစ် ပြောင်းလဲပေးသောဖိုင်ဖြစ်ပါသည် |
| **main branch** | Website သည် `main` branch မှ Deploy ဖြစ်ပါသည် |
| **public folder** | GitLab Pages သည် `public` folder ထဲက ဖိုင်များကို Serve ပြုလုပ်ပါသည် |
| **SEO** | Google မှာ ရှာတွေ့ဖို့အတွက် Meta tags များ ထည့်ပေးထားပါသည် |

---

## 🔗 အသုံးဝင်သော Links

- **GitLab Project:** https://gitlab.com/porfolio-group1/porfolio-project
- **GitLab Pages:** https://porfolio-group1.gitlab.io/porfolio-project/
- **Pipeline Status:** https://gitlab.com/porfolio-group1/porfolio-project/-/pipelines

---

## ❓ အဆင်မပြေတာရှိရင်

1. **Pipeline Failed ဖြစ်ခဲ့ပါက:**
   - Pipelines page သို့ သွားပါ
   - Failed pipeline ကို နှိပ်ပြီး Error message ကို ဖတ်ပါ

2. **Website မ Live မဖြစ်ခဲ့ပါက:**
   - `.gitlab-ci.yml` ဖိုင်သည် `kyawhtet-website` folder ထဲမှာ ရှိသည်ကို ကြည့်ပါ
   - Pipeline ကို Refresh လုပ်ကြည့်ပါ

3. **Git Push မဖြစ်ခဲ့ပါက:**
   - GitLab Username နှင့် Password မှန်ကန်သည်ကို ကြည့်ပါ
   - Internet Connection ကို ကြည့်ပါ

---

## 🎉 အောင်မြင်ပါပြီ!

သင့် Website သည် GitLab Pages တွင် Live ဖြစ်သွားပါပြီ။ ယခုအခါ မည်သည့်အခါမျှ ဖိုင်များကို Update လုပ်ပြီး Push လုပ်ရုံဖြင့် Website သည် အလိုအလျောက် Update ဖြစ်သွားပါလိမ့်မည်။

Happy coding! 🚀
