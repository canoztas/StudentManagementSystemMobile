# StudentManagementSystemMobileApp
A basic Mobile Application on Flutter for BLM4537 
<h3> BLM4537 - iOS İle Mobil Uygulama Geliştirme </h3>
<h3> Proje Tasarım Ön Çalışması ve Teknik Şartnamesi </h3>



Bu derste Flutter ile bir öğrenci bilgi sistemi (OBS) uygulaması geliştirilecektir.

Yapılması planlanan işler:
<ol>
  <li>Tüm uygulama API kullanacak</li>
  <ol>
      <li>REST API</li>
      <li>.NET CORE standardında göre endpoint’lerin HTTP Request ve parametreleri</li>
      <li>Silme işlemlerinin hepsi soft-delete</li>
  </ol>

  <li>Öğrenci - Öğretmen tipi kullanıcılar</li>
  <ol>
      <li>Kullanıcı giriş paneli</li>
      <li>Kayıt olma paneli</li>
      <li>Parolamı unuttum paneli (duruma göre mail entegrasyonu)</li>
      <li>Kullanıcının dashboard’u</li>
  </ol>

  <li>Öğrenci - Öğretmen tipi kullanıcıların yetkilendirilmesi</li>
  <ol>
      <li>Her rolün erişebildiği api endpointleri ayrı olacak</li>
      <li>Yetkilendirme için cookie-based veya session-based bir auth sistemi (duruma göre jwt)</li>
  </ol>

  <li>Öğretmen tipi kullanıcılar</li>
  <ol>
      <li>Ders açma, kapama ve modify etme işlemi</li>
      <li>Derse kayıtlı öğrenci listeleme</li>
      <li>Öğrencilere puan ve kişisel not ekleme</li>
  </ol>


  <li>Öğrenci tipi kullanıcılar</li>
  <ol>
      <li>Derse kayıt olma, kayıt silme</li>
      <li>Ders notlarını görüntüleme</li>
      <li>Ders programı görüntüleme</li>
  </ol>
</ol>


![Preview](/gif.gif)

![App UI](/ui.png)
