<?php
$lastUpdated = '19 فبراير 2026';
$appName = 'كسوتي';
$packageName = 'com.ruq.keswaty';
$website = 'https://keswaty.com';
?>
<!doctype html>
<html lang="ar" dir="rtl">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>سياسة الخصوصية - <?php echo $appName; ?></title>
  <style>
    :root {
      color-scheme: light;
      --bg: #f6f8fb;
      --card: #ffffff;
      --text: #14213d;
      --muted: #4f6078;
      --border: #dce4ef;
      --accent: #0b7285;
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      background: radial-gradient(circle at top right, #e9f7fb, var(--bg) 45%);
      font-family: "Tahoma", "Arial", sans-serif;
      color: var(--text);
      line-height: 1.9;
    }
    .container {
      max-width: 920px;
      margin: 24px auto;
      padding: 0 16px;
    }
    .card {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 16px;
      padding: 20px;
      box-shadow: 0 8px 24px rgba(20, 33, 61, 0.06);
    }
    h1, h2 {
      margin: 0 0 12px 0;
      line-height: 1.4;
    }
    h1 {
      color: var(--accent);
      font-size: 28px;
    }
    h2 {
      font-size: 20px;
      margin-top: 22px;
    }
    p {
      margin: 0 0 10px 0;
      color: var(--muted);
    }
    ul {
      margin: 0 0 12px 0;
      padding-right: 20px;
      color: var(--muted);
    }
    li { margin-bottom: 6px; }
    .meta {
      margin: 8px 0 16px 0;
      padding: 10px 12px;
      border: 1px dashed var(--border);
      border-radius: 12px;
      background: #f9fcff;
      color: var(--muted);
    }
    .footer {
      margin-top: 24px;
      font-size: 14px;
      color: var(--muted);
    }
    a {
      color: var(--accent);
      text-decoration: none;
    }
    a:hover { text-decoration: underline; }
  </style>
</head>
<body>
  <main class="container">
    <section class="card">
      <h1>سياسة الخصوصية لتطبيق <?php echo $appName; ?></h1>
      <div class="meta">
        <strong>اسم الحزمة:</strong> <?php echo $packageName; ?><br>
        <strong>آخر تحديث:</strong> <?php echo $lastUpdated; ?>
      </div>

      <p>
        توضّح هذه السياسة كيفية جمع واستخدام وحماية المعلومات عند استخدام تطبيق <?php echo $appName; ?>.
        باستخدامك التطبيق فإنك توافق على هذه السياسة.
      </p>

      <h2>1) المعلومات التي قد نجمعها</h2>
      <ul>
        <li>معلومات الحساب التي تدخلها بنفسك مثل: الاسم، البريد الإلكتروني، رقم الهاتف، والعنوان.</li>
        <li>بيانات الموقع الجغرافي عند استخدام ميزات تحديد الموقع على الخريطة.</li>
        <li>الصور أو الملفات التي تختار رفعها من جهازك ضمن وظائف التطبيق.</li>
        <li>بيانات تقنية أساسية مثل نوع الجهاز، نظام التشغيل، وسجلات الأعطال لتحسين الاستقرار.</li>
      </ul>

      <h2>2) كيفية استخدام المعلومات</h2>
      <ul>
        <li>إنشاء الحساب وتسجيل الدخول وإدارة الملف الشخصي.</li>
        <li>تنفيذ خدمات التطبيق الأساسية وعرض المحتوى المرتبط بالموقع.</li>
        <li>التواصل معك بخصوص الطلبات أو الدعم أو الملاحظات.</li>
        <li>تحسين الأداء والأمان ومنع إساءة الاستخدام.</li>
      </ul>

      <h2>3) أذونات Android المستخدمة</h2>
      <ul>
        <li><strong>INTERNET</strong>: للاتصال بخوادم التطبيق.</li>
        <li><strong>ACCESS_FINE_LOCATION / ACCESS_COARSE_LOCATION</strong>: لتحديد موقع المستخدم عند الحاجة داخل التطبيق.</li>
        <li><strong>ACCESS_NETWORK_STATE</strong>: للتحقق من حالة الاتصال بالشبكة.</li>
        <li><strong>FOREGROUND_SERVICE</strong>: لدعم بعض العمليات النشطة أثناء الاستخدام.</li>
        <li><strong>READ/WRITE_EXTERNAL_STORAGE</strong>: لاختيار الوسائط من الجهاز في الإصدارات التي تتطلب ذلك.</li>
      </ul>

      <h2>4) مشاركة المعلومات مع أطراف ثالثة</h2>
      <p>لا نقوم ببيع بياناتك الشخصية.</p>
      <p>قد تتم مشاركة بيانات محدودة فقط عند الضرورة مع:</p>
      <ul>
        <li>مزودي خدمات فنية (مثل خدمات الخرائط أو الاستضافة) لتشغيل وظائف التطبيق.</li>
        <li>الجهات الرسمية إذا كان ذلك مطلوبًا بموجب القانون.</li>
      </ul>

      <h2>5) الاحتفاظ بالبيانات</h2>
      <p>
        نحتفظ بالبيانات طالما كانت لازمة لتقديم الخدمة أو للوفاء بالالتزامات القانونية،
        ثم يتم حذفها أو إخفاء هويتها قدر الإمكان.
      </p>

      <h2>6) حماية البيانات</h2>
      <p>
        نطبق إجراءات تقنية وتنظيمية مناسبة لحماية البيانات من الوصول غير المصرح أو التعديل أو الفقد،
        ومع ذلك لا يمكن ضمان أمان بنسبة 100% لأي نقل بيانات عبر الإنترنت.
      </p>

      <h2>7) حقوقك</h2>
      <p>
        يمكنك طلب الاطلاع على بياناتك أو تعديلها أو حذفها وفقًا للأنظمة المعمول بها، عبر التواصل معنا
        من خلال قنوات الدعم داخل التطبيق أو عبر الموقع.
      </p>

      <h2>8) خصوصية الأطفال</h2>
      <p>
        التطبيق غير مخصص عمدًا لجمع بيانات الأطفال بشكل مستقل دون إشراف ولي الأمر.
        إذا تبيّن لنا وجود بيانات غير مناسبة، سنقوم بمعالجتها أو حذفها.
      </p>

      <h2>9) التعديلات على السياسة</h2>
      <p>
        قد نقوم بتحديث هذه السياسة من وقت لآخر. يتم نشر النسخة الأحدث في هذه الصفحة مع تاريخ التحديث.
      </p>

      <h2>10) التواصل معنا</h2>
      <p>
        لأي استفسار متعلق بالخصوصية يمكنك التواصل عبر موقعنا:
        <a href="<?php echo $website; ?>" target="_blank" rel="noopener"><?php echo $website; ?></a>
      </p>

      <p class="footer">
        هذه الصفحة مخصصة لاستخدامها كرابط سياسة الخصوصية لتطبيق Google Play:
        <strong><?php echo $packageName; ?></strong>
      </p>
    </section>
  </main>
</body>
</html>
