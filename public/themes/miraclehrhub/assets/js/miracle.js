(function ($) {
  "use strict";

  /*-- Checkout Accoradin --*/
  if ($(".checkout-page__payment__title").length) {
    $(".checkout-page__payment__item")
      .find(".checkout-page__payment__content")
      .hide();
    $(".checkout-page__payment__item--active")
      .find(".checkout-page__payment__content")
      .show();
    $(".checkout-page__payment__title").on("click", function (e) {
      e.preventDefault();
      $(this)
        .parents(".checkout-page__payment")
        .find(".checkout-page__payment__item")
        .removeClass("checkout-page__payment__item--active");
      $(this)
        .parents(".checkout-page__payment")
        .find(".checkout-page__payment__content")
        .slideUp();
      $(this).parent().addClass("checkout-page__payment__item--active");
      $(this).parent().find(".checkout-page__payment__content").slideDown();
    });
  }

  let dynamicyearElm = $(".dynamic-year");
  if (dynamicyearElm.length) {
    let currentYear = new Date().getFullYear();
    dynamicyearElm.html(currentYear);
  }

  // Date Picker
  if ($(".hiredots-datepicker").length) {
    $(".hiredots-datepicker").each(function () {
      $(this).datepicker();
    });
  }

  // Popular Causes Progress Bar
  if ($(".count-bar").length) {
    $(".count-bar").appear(
      function () {
        var el = $(this);
        var percent = el.data("percent");
        $(el).css("width", percent).addClass("counted");
      }, {
      accY: -50
    }
    );
  }

  //Fact Counter + Text Count
  if ($(".count-box").length) {
    $(".count-box").appear(
      function () {
        var $t = $(this),
          n = $t.find(".count-text").attr("data-stop"),
          r = parseInt($t.find(".count-text").attr("data-speed"), 10);

        if (!$t.hasClass("counted")) {
          $t.addClass("counted");
          $({
            countNum: $t.find(".count-text").text()
          }).animate({
            countNum: n
          }, {
            duration: r,
            easing: "linear",
            step: function () {
              $t.find(".count-text").text(Math.floor(this.countNum));
            },
            complete: function () {
              $t.find(".count-text").text(this.countNum);
            }
          });
        }
      }, {
      accY: 0
    }
    );
  }

  // custom coursor
  if ($(".custom-cursor").length) {
    var cursor = document.querySelector(".custom-cursor__cursor");
    var cursorinner = document.querySelector(".custom-cursor__cursor-two");
    var a = document.querySelectorAll("a");

    document.addEventListener("mousemove", function (e) {
      var x = e.clientX;
      var y = e.clientY;
      cursor.style.transform = `translate3d(calc(${e.clientX}px - 50%), calc(${e.clientY}px - 50%), 0)`;
    });

    document.addEventListener("mousemove", function (e) {
      var x = e.clientX;
      var y = e.clientY;
      cursorinner.style.left = x + "px";
      cursorinner.style.top = y + "px";
    });

    document.addEventListener("mousedown", function () {
      cursor.classList.add("click");
      cursorinner.classList.add("custom-cursor__innerhover");
    });

    document.addEventListener("mouseup", function () {
      cursor.classList.remove("click");
      cursorinner.classList.remove("custom-cursor__innerhover");
    });

    a.forEach((item) => {
      item.addEventListener("mouseover", () => {
        cursor.classList.add("custom-cursor__hover");
      });
      item.addEventListener("mouseleave", () => {
        cursor.classList.remove("custom-cursor__hover");
      });
    });
  }

  if ($(".contact-form-validated").length) {
    $(".contact-form-validated").validate({
      // initialize the plugin
      rules: {
        name: {
          required: true
        },
        email: {
          required: true,
          email: true
        },
        message: {
          required: true
        },
        subject: {
          required: true
        }
      },
      submitHandler: function (form) {
        // sending value with ajax request
        $.post(
          $(form).attr("action"),
          $(form).serialize(),
          function (response) {
            $(form).parent().find(".result").append(response);
            $(form).find('input[type="text"]').val("");
            $(form).find('input[type="email"]').val("");
            $(form).find("textarea").val("");
          }
        );
        return false;
      }
    });
  }

  // mailchimp form
  if ($(".mc-form").length) {
    $(".mc-form").each(function () {
      var Self = $(this);
      var mcURL = Self.data("url");
      var mcResp = Self.parent().find(".mc-form__response");

      Self.ajaxChimp({
        url: mcURL,
        callback: function (resp) {
          // appending response
          mcResp.append(function () {
            return '<p class="mc-message">' + resp.msg + "</p>";
          });
          // making things based on response
          if (resp.result === "success") {
            // Do stuff
            Self.removeClass("errored").addClass("successed");
            mcResp.removeClass("errored").addClass("successed");
            Self.find("input").val("");

            mcResp.find("p").fadeOut(10000);
          }
          if (resp.result === "error") {
            Self.removeClass("successed").addClass("errored");
            mcResp.removeClass("successed").addClass("errored");
            Self.find("input").val("");

            mcResp.find("p").fadeOut(10000);
          }
        }
      });
    });
  }

  if ($(".video-popup").length) {
    $(".video-popup").magnificPopup({
      type: "iframe",
      mainClass: "mfp-fade",
      removalDelay: 160,
      preloader: true,

      fixedContentPos: false
    });
  }

  if ($(".img-popup").length) {
    var groups = {};
    $(".img-popup").each(function () {
      var id = parseInt($(this).attr("data-group"), 10);

      if (!groups[id]) {
        groups[id] = [];
      }

      groups[id].push(this);
    });

    $.each(groups, function () {
      $(this).magnificPopup({
        type: "image",
        closeOnContentClick: true,
        closeBtnInside: false,
        gallery: {
          enabled: true
        }
      });
    });
  }

  function dynamicCurrentMenuClass(selector) {
    let FileName = window.location.href.split("/").reverse()[0];

    selector.find("li").each(function () {
      let anchor = $(this).find("a");
      if ($(anchor).attr("href") == FileName) {
        $(this).addClass("current");
      }
    });
    // if any li has .current elmnt add class
    selector.children("li").each(function () {
      if ($(this).find(".current").length) {
        $(this).addClass("current");
      }
    });
    // if no file name return
    if ("" == FileName) {
      selector.find("li").eq(0).addClass("current");
    }
  }

  if ($(".main-menu__list").length) {
    // dynamic current class
    let mainNavUL = $(".main-menu__list");
    dynamicCurrentMenuClass(mainNavUL);
  }

  if ($(".service-sidebar__nav").length) {
    // dynamic current class
    let mainNavUL = $(".service-sidebar__nav");
    dynamicCurrentMenuClass(mainNavUL);
  }

  if ($(".main-menu").length && $(".mobile-nav__container").length) {
    let navContent = document.querySelector(".main-menu").innerHTML;
    let mobileNavContainer = document.querySelector(".mobile-nav__container");
    mobileNavContainer.innerHTML = navContent;
  }

  if ($(".sticky-header").length) {
    $(".sticky-header")
      .clone()
      .insertAfter(".sticky-header")
      .addClass("sticky-header--cloned");
  }

  if ($(".mobile-nav__container .main-menu__list").length) {
    let dropdownAnchor = $(
      ".mobile-nav__container .main-menu__list .dropdown > a"
    );
    dropdownAnchor.each(function () {
      let self = $(this);
      let toggleBtn = document.createElement("BUTTON");
      toggleBtn.setAttribute("aria-label", "dropdown toggler");
      toggleBtn.innerHTML = "<i class='fa fa-angle-down'></i>";
      self.append(function () {
        return toggleBtn;
      });
      self.find("button").on("click", function (e) {
        e.preventDefault();
        let self = $(this);
        self.toggleClass("expanded");
        self.parent().toggleClass("expanded");
        self.parent().parent().children("ul").slideToggle();
      });
    });
  }

  //Show Popup menu
  $(document).on("click", ".megamenu-clickable--toggler > a", function (e) {
    $("body").toggleClass("megamenu-popup-active");
    $(this).parent().find("ul").toggleClass("megamenu-clickable--active");
    e.preventDefault();
  });
  $(document).on("click", ".megamenu-clickable--close", function (e) {
    $("body").removeClass("megamenu-popup-active");
    $(".megamenu-clickable--active").removeClass("megamenu-clickable--active");
    e.preventDefault();
  });

  if ($(".mobile-nav__toggler").length) {
    $(".mobile-nav__toggler").on("click", function (e) {
      e.preventDefault();
      $(".mobile-nav__wrapper").toggleClass("expanded");
      $("body").toggleClass("locked");
    });
  }

  if ($(".search-toggler").length) {
    $(".search-toggler").on("click", function (e) {
      e.preventDefault();
      $(".search-popup").toggleClass("active");
      $(".mobile-nav__wrapper").removeClass("expanded");
      $("body").toggleClass("locked");
    });
  }
  if ($(".mini-cart__toggler").length) {
    $(".mini-cart__toggler").on("click", function (e) {
      e.preventDefault();
      $(".mini-cart").toggleClass("expanded");
      $(".mobile-nav__wrapper").removeClass("expanded");
      $("body").toggleClass("locked");
    });
  }
  if ($(".odometer").length) {
    $(".odometer").appear(function (e) {
      var odo = $(".odometer");
      odo.each(function () {
        var countNumber = $(this).attr("data-count");
        $(this).html(countNumber);
      });
    });
  }

  if ($(".wow").length) {
    var wow = new WOW({
      boxClass: "wow", // animated element css class (default is wow)
      animateClass: "animated", // animation css class (default is animated)
      mobile: true, // trigger animations on mobile devices (default is true)
      live: true // act on asynchronously loaded content (default is true)
    });
    wow.init();
  }

  if ($("#donate-amount__predefined").length) {
    let donateInput = $("#donate-amount");
    $("#donate-amount__predefined")
      .find("li")
      .on("click", function (e) {
        e.preventDefault();
        let amount = $(this).find("a").text();
        donateInput.val(amount);
        $("#donate-amount__predefined").find("li").removeClass("active");
        $(this).addClass("active");
      });
  }

  //accrodion
  if ($(".hiredots-accrodion").length) {
    var accrodionGrp = $(".hiredots-accrodion");
    accrodionGrp.each(function () {
      var accrodionName = $(this).data("grp-name");
      var Self = $(this);
      var accordion = Self.find(".accrodion");
      Self.addClass(accrodionName);
      Self.find(".accrodion .accrodion-content").hide();
      Self.find(".accrodion.active").find(".accrodion-content").show();
      accordion.each(function () {
        $(this)
          .find(".accrodion-title")
          .on("click", function () {
            if ($(this).parent().hasClass("active") === false) {
              $(".hiredots-accrodion." + accrodionName)
                .find(".accrodion")
                .removeClass("active");
              $(".hiredots-accrodion." + accrodionName)
                .find(".accrodion")
                .find(".accrodion-content")
                .slideUp();
              $(this).parent().addClass("active");
              $(this).parent().find(".accrodion-content").slideDown();
            }
          });
      });
    });
  }

  $(".add").on("click", function () {
    if ($(this).prev().val() < 999) {
      $(this)
        .prev()
        .val(+$(this).prev().val() + 1);
    }
  });

  $(".sub").on("click", function () {
    if ($(this).next().val() > 0) {
      if ($(this).next().val() > 0)
        $(this)
          .next()
          .val(+$(this).next().val() - 1);
    }
  });

  if ($(".tabs-box").length) {
    $(".tabs-box .tab-buttons .tab-btn").on("click", function (e) {
      e.preventDefault();
      var target = $($(this).attr("data-tab"));

      if ($(target).is(":visible")) {
        return false;
      } else {
        target
          .parents(".tabs-box")
          .find(".tab-buttons")
          .find(".tab-btn")
          .removeClass("active-btn");
        $(this).addClass("active-btn");
        target
          .parents(".tabs-box")
          .find(".tabs-content")
          .find(".tab")
          .fadeOut(0);
        target
          .parents(".tabs-box")
          .find(".tabs-content")
          .find(".tab")
          .removeClass("active-tab");
        $(target).fadeIn(300);
        $(target).addClass("active-tab");
      }
    });
  }

  if ($(".range-slider-price").length) {
    var priceRange = document.getElementById("range-slider-price");

    noUiSlider.create(priceRange, {
      start: [30, 150],
      limit: 200,
      behaviour: "drag",
      connect: true,
      range: {
        min: 10,
        max: 200
      }
    });

    var limitFieldMin = document.getElementById("min-value-rangeslider");
    var limitFieldMax = document.getElementById("max-value-rangeslider");

    priceRange.noUiSlider.on("update", function (values, handle) {
      (handle ? $(limitFieldMax) : $(limitFieldMin)).text(values[handle]);
    });
  }

  function hiredotsOwlInit() {
    // owl slider
    let hiredotsowlCarousel = $(".hiredots-owl__carousel");
    if (hiredotsowlCarousel.length) {
      hiredotsowlCarousel.each(function () {
        let elm = $(this);
        let options = elm.data("owl-options");
        let hiredotsOwlCarousel = elm.owlCarousel(
          "object" === typeof options ? options : JSON.parse(options)
        );
        elm.find("button").each(function () {
          $(this).attr("aria-label", "carousel button");
        });
      });
    }
    let hiredotsowlCarouselNav = $(".hiredots-owl__carousel--custom-nav");
    if (hiredotsowlCarouselNav.length) {
      hiredotsowlCarouselNav.each(function () {
        let elm = $(this);
        let owlNavPrev = elm.data("owl-nav-prev");
        let owlNavNext = elm.data("owl-nav-next");
        $(owlNavPrev).on("click", function (e) {
          elm.trigger("prev.owl.carousel");
          e.preventDefault();
        });

        $(owlNavNext).on("click", function (e) {
          elm.trigger("next.owl.carousel");
          e.preventDefault();
        });
      });
    }
  }

  function hiredotsSlickInit() {
    // slick slider
    let hiredotsslickCarousel = $(".hiredots-slick__carousel");
    if (hiredotsslickCarousel.length) {
      hiredotsslickCarousel.each(function () {
        let elm = $(this);
        let options = elm.data("slick-options");
        let hiredotsslickCarousel = elm.slick(
          "object" === typeof options ? options : JSON.parse(options)
        );
      });
    }
  }

  /*-- Handle Scrollbar --*/
  function handleScrollbar() {
    const bodyHeight = $("body").height();
    const scrollPos = $(window).innerHeight() + $(window).scrollTop();
    let percentage = (scrollPos / bodyHeight) * 100;
    if (percentage > 100) {
      percentage = 100;
    }
    $(".scroll-to-top .scroll-to-top__inner").css("width", percentage + "%");
  }

  /*-- One Page Menu --*/
  function SmoohiredotsenuScroll() {
    var anchor = $(".scrollToLink");
    if (anchor.length) {
      anchor.children("a").bind("click", function (event) {
        if ($(window).scrollTop() > 10) {
          var headerH = "0";
        } else {
          var headerH = "0";
        }
        var target = $(this);
        $("html, body")
          .stop()
          .animate({
            scrollTop: $(target.attr("href")).offset().top - headerH + "px"
          },
            900,
            "easeInOutExpo"
          );
        anchor.removeClass("current");
        anchor.removeClass("current-menu-ancestor");
        anchor.removeClass("current_page_item");
        anchor.removeClass("current-menu-parent");
        target.parent().addClass("current");
        event.preventDefault();
      });
    }
  }
  SmoohiredotsenuScroll();

  function OnePageMenuScroll() {
    var windscroll = $(window).scrollTop();
    if (windscroll >= 117) {
      var menuAnchor = $(".one-page-scroll-menu .scrollToLink").children("a");
      menuAnchor.each(function () {
        var sections = $(this).attr("href");
        $(sections).each(function () {
          if ($(this).offset().top <= windscroll + 100) {
            var Sectionid = $(sections).attr("id");
            $(".one-page-scroll-menu").find("li").removeClass("current");
            $(".one-page-scroll-menu")
              .find("li")
              .removeClass("current-menu-ancestor");
            $(".one-page-scroll-menu")
              .find("li")
              .removeClass("current_page_item");
            $(".one-page-scroll-menu")
              .find("li")
              .removeClass("current-menu-parent");
            $(".one-page-scroll-menu")
              .find("a[href*=\\#" + Sectionid + "]")
              .parent()
              .addClass("current");
          }
        });
      });
    } else {
      $(".one-page-scroll-menu li.current").removeClass("current");
      $(".one-page-scroll-menu li:first").addClass("current");
    }
  }

  // window scroll event
  function stickyMenuUpScroll($targetMenu, $toggleClass) {
    var lastScrollTop = 0;
    window.addEventListener(
      "scroll",
      function () {
        var st = window.pageYOffset || document.documentElement.scrollTop;
        if (st > 500) {
          if (st > lastScrollTop) {
            // downscroll code
            $targetMenu.removeClass($toggleClass);
            // console.log("down");
          } else {
            // upscroll code
            $targetMenu.addClass($toggleClass);
            // console.log("up");
          }
        } else {
          $targetMenu.removeClass($toggleClass);
        }
        lastScrollTop = st;
      },
      false
    );
  }
  stickyMenuUpScroll($(".sticky-header--normal"), "active");

  //Strech Column
  function hiredots_stretch() {
    var i = $(window).width();
    $(".row .hiredots-stretch-element-inside-column").each(function () {
      var $this = $(this),
        row = $this.closest(".row"),
        cols = $this.closest('[class^="col-"]'),
        colsheight = $this.closest('[class^="col-"]').height(),
        rect = this.getBoundingClientRect(),
        l = row[0].getBoundingClientRect(),
        s = cols[0].getBoundingClientRect(),
        r = rect.left,
        d = i - rect.right,
        c = l.left + (parseFloat(row.css("padding-left")) || 0),
        u = i - l.right + (parseFloat(row.css("padding-right")) || 0),
        p = s.left,
        f = i - s.right,
        styles = {
          "margin-left": 0,
          "margin-right": 0
        };
      if (Math.round(c) === Math.round(p)) {
        var h = parseFloat($this.css("margin-left") || 0);
        styles["margin-left"] = h - r;
      }
      if (Math.round(u) === Math.round(f)) {
        var w = parseFloat($this.css("margin-right") || 0);
        styles["margin-right"] = w - d;
      }
      $this.css(styles);
    });
  }
  hiredots_stretch();

  function hiredots_cuved_circle() {
    let circleTypeElm = $(".curved-circle--item");
    if (circleTypeElm.length) {
      circleTypeElm.each(function () {
        let elm = $(this);
        let options = elm.data("circle-text-options");
        elm.circleType(
          "object" === typeof options ? options : JSON.parse(options)
        );
      });
    }
  }

  /*-- Price Range --*/
  function priceFilter() {
    if ($(".price-ranger").length) {
      $(".price-ranger #slider-range").slider({
        range: true,
        min: 50,
        max: 1000,
        values: [11, 500],
        slide: function (event, ui) {
          $(".price-ranger .ranger-min-max-block .min").val("$" + ui.values[0]);
          $(".price-ranger .ranger-min-max-block .max").val("$" + ui.values[1]);
        }
      });
      $(".price-ranger .ranger-min-max-block .min").val(
        "$" + $(".price-ranger #slider-range").slider("values", 0)
      );
      $(".price-ranger .ranger-min-max-block .max").val(
        "$" + $(".price-ranger #slider-range").slider("values", 1)
      );
    }
  }

  // window load event

  $(window).on("load", function () {
    if ($(".preloader").length) {
      $(".preloader").fadeOut();
    }
    hiredotsOwlInit();
    hiredotsSlickInit();
    priceFilter();

    if ($(".circle-progress").length) {
      $(".circle-progress").appear(function () {
        let circleProgress = $(".circle-progress");
        circleProgress.each(function () {
          let progress = $(this);
          let progressOptions = progress.data("options");
          progress.circleProgress(progressOptions);
        });
      });
    }
    if ($(".masonry-layout").length) {
      $(".masonry-layout").imagesLoaded(function () {
        $(".masonry-layout").isotope({
          layoutMode: "masonry"
        });
      });
    }
    if ($(".fitRow-layout").length) {
      $(".fitRow-layout").imagesLoaded(function () {
        $(".fitRow-layout").isotope({
          layoutMode: "fitRows"
        });
      });
    }

    if ($(".post-filter").length) {
      var postFilterList = $(".post-filter li");
      // for first init
      $(".filter-layout").isotope({
        filter: ".filter-item",
        animationOptions: {
          duration: 500,
          easing: "linear",
          queue: false
        }
      });
      // on click filter links
      postFilterList.on("click", function () {
        var Self = $(this);
        var selector = Self.attr("data-filter");
        postFilterList.removeClass("active");
        Self.addClass("active");

        $(".filter-layout").isotope({
          filter: selector,
          animationOptions: {
            duration: 500,
            easing: "linear",
            queue: false
          }
        });
        return false;
      });
    }

    if ($(".post-filter.has-dynamic-filter-counter").length) {
      // var allItem = $('.single-filter-item').length;

      var activeFilterItem = $(".post-filter.has-dynamic-filter-counter").find(
        "li"
      );

      activeFilterItem.each(function () {
        var filterElement = $(this).data("filter");
        var count = $(".filter-layout").find(filterElement).length;
        $(this).append("<sup>[" + count + "]</sup>");
      });
    }

    hiredots_cuved_circle();
  });

  $(window).on("scroll", function () {
    OnePageMenuScroll();
    handleScrollbar();
    if ($(".sticky-header--one-page").length) {
      var headerScrollPos = 130;
      var stricky = $(".sticky-header--one-page");
      if ($(window).scrollTop() > headerScrollPos) {
        stricky.addClass("active");
      } else if ($(this).scrollTop() <= headerScrollPos) {
        stricky.removeClass("active");
      }
    }

    var scrollToTopBtn = ".scroll-to-top";
    if (scrollToTopBtn.length) {
      if ($(window).scrollTop() > 500) {
        $(scrollToTopBtn).addClass("show");
      } else {
        $(scrollToTopBtn).removeClass("show");
      }
    }
  });

  $(window).on("resize", function () {
    hiredots_stretch();
  });



  let $applyNow = $('#ModalApplyJobForm');
  $applyNow.on('show.bs.modal', function (e) {
    const button = $(e.relatedTarget);
    const jobId = button.data('job-id');
    const jobName = button.data('job-name');
    const jobCompany = button.data('job-company');
    const jobCountry = button.data('job-country');

    //console.log(jobName, jobId);

    $applyNow.find(".text-brand-1").html(jobName);
    $applyNow.find(".job-info").html(jobCompany + ", " + jobCountry);
    $applyNow.find('.modal-job-name').val(jobName);
    $applyNow.find('.modal-job-id').val(jobId);
  });

  $applyNow.on('hide.bs.modal', function () {
    $applyNow.find('.modal-job-name').val('');
    $applyNow.find('.modal-job-id').val('');
    $applyNow.find(".text-brand-1").html('Job Title');
    $applyNow.find(".job-info").html("");
  });

  $(document).on('submit', '.job-apply-form', function (e) {
    e.preventDefault();

    //console.log('submit clicked');
    const $this = $(e.currentTarget);
    let _self = $this.find('button[type=submit]');

    $.ajax({
      type: 'POST',
      cache: false,
      url: $this.prop('action'),
      data: new FormData($this[0]),
      contentType: false,
      processData: false,
      beforeSend: () => {
        _self.prop('disabled', true).addClass('button-loading');
        //console.log('button disabled');
      },
      success: res => {
        //console.log('destination found',res);
        if (!res.error) {
          if (!res.data.url) {
            //console.log("misson complete");
            showSuccess(res.message)
          }
          setTimeout(function () {
            //console.log("wooo: ",res.data);
            if (res.data && res.data.url) {
              window.location.replace(res.data.url);
            } else {
              window.location.reload();
            }
          }, 1000);
        } else {
          //console.log("caugot error 1");
          showError(res.message);
        }
      },
      error: res => {
        //console.log("caugot error 2");
        showError(res.responseJSON.message);
      },
      complete: () => {
        console.log("caugot error 3");
        if (typeof refreshRecaptcha !== 'undefined') {
          refreshRecaptcha();
        }
        _self.prop('disabled', false).removeClass('button-loading');
      }
    });
  });

  const showError = message => {
    //console.log('showerror', message);
    window.showAlert('alert-danger', message);
  }

  const showSuccess = message => {
    window.showAlert('alert-success', message);
  }

  window.showAlert = (messageType, message) => {

    //console.log('showAlert', message, messageType);
    if (messageType && message !== '') {
      let alertId = Math.floor(Math.random() * 1000);

      let type = null
      let colorType = null
      let title = null

      switch (messageType) {
        case 'alert-success':
          type = `<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" width="45px">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                      </svg>`

          colorType = 'success'
          title = 'Success'
          break

        case 'status':
          type = `<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" width="45px">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                      </svg>`

          colorType = 'success'
          title = 'Success'
          break

        case 'alert-danger':
          type = `<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" width="45px">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                      </svg>`

          colorType = 'error'
          title = 'Errors'
          break
      }

      let html = `
          <div class="toast ${colorType}" id="${alertId}">
              <div class="outer-container">
                  ${type}
              </div>
              <div class="inner-container">
                  <p>${title}</p>
                  <p>${message}</p>
              </div>
              <a class="close-toast" >&times;</a>
          </div>
      `;

      $('#alert-container').append(html).ready(() => {
        window.setTimeout(() => {
          //$(`#alert-container #${alertId}`).remove();
        }, 6000);
      });

      $('#alert-container').on('click', '.close-toast', function (event) {
        event.preventDefault()
        $(this).closest('.toast').remove()
      })

    }
  }

})(jQuery);


//job board function
(function ($) {
  "use strict";

  let JobBoardApp = {};

  JobBoardApp.$formSearch = $('#jobs-filter-form');
  JobBoardApp.jobListing = '.jobs-listing';
  JobBoardApp.$jobListing = $(JobBoardApp.jobListing);
  JobBoardApp.parseParamsSearch = function (query, includeArray = false) {
      let pairs = query || window.location.search.substring(1);
      let re = /([^&=]+)=?([^&]*)/g;
      let decodeRE = /\+/g;  // Regex for replacing addition symbol with a space
      let decode = function (str) {
          return decodeURIComponent(str.replace(decodeRE, " "));
      };

      let params = {}, e;
      while (e = re.exec(pairs)) {
          let k = decode(e[1]), v = decode(e[2]);
          if (k.substring(k.length - 2) === '[]') {
              if (includeArray) {
                  k = k.substring(0, k.length - 2);
              }
              (params[k] || (params[k] = [])).push(v);
          } else params[k] = v;
      }
      return params;
  }

  JobBoardApp.changeInputInSearchForm = function (parseParams) {
      JobBoardApp.$formSearch
          .find('input, select, textarea')
          .each(function (e, i) {
              JobBoardApp.changeInputInSearchFormDetail($(i), parseParams);
          });


      $(':input[form=jobs-filter-form]')
          .each(function (e, i) {
              JobBoardApp.changeInputInSearchFormDetail($(i), parseParams);
          });
  };

  JobBoardApp.changeInputInSearchFormDetail = function ($el, parseParams) {
      const name = $el.attr('name');
      let value = parseParams[name] || null;
      const type = $el.attr('type');
      switch (type) {
          case 'checkbox':
          case 'radio':
              $el.prop('checked', false);
              if (Array.isArray(value)) {
                  $el.prop('checked', value.includes($el.val()));
              } else {
                  $el.prop('checked', !!value);
              }
              break;
          default:
              if ($el.is('[name=max_price]')) {
                  $el.val(value || $el.data('max'));
              } else if ($el.is('[name=min_price]')) {
                  $el.val(value || $el.data('min'));
              } else if ($el.val() !== value) {
                  $el.val(value);
              }
              break;
      }
  }

  JobBoardApp.convertFromDataToArray = function (formData) {
      let data = [];
      formData.forEach(function (obj) {
          if (
              obj.name === 'offered_salary_to'
              && parseInt(obj.value) === parseInt($('input[name="offered_salary_to"]').data('default-value'))
          ) {
              return;
          }

          if (obj.value) {
              // break with price
              if (['min_price', 'max_price'].includes(obj.name)) {
                  const dataValue = JobBoardApp.$formSearch
                      .find('input[name=' + obj.name + ']')
                      .data(obj.name.substring(0, 3));
                  if (dataValue === parseInt(obj.value)) {
                      return;
                  }
              }
              data.push(obj);
          }
      });

      return data;
  };

  JobBoardApp.jobsFilter = function () {
      let ajaxSending = null;
      $(document).on('submit', '#jobs-filter-form', function (e) {
          e.preventDefault();

          if ($(document).find('.sidebar-filter-mobile').hasClass('active')) {
              $(document).find('.sidebar-filter-mobile').removeClass('active')

              $('html, body').animate({
                  scrollTop: $(".job-content-section").offset().top - 150
              });
          }

          if (ajaxSending) {
              ajaxSending.abort();
          }

          const $form = $(e.currentTarget);
          let formData = $form.serializeArray();
          let data = JobBoardApp.convertFromDataToArray(formData);
          let uriData = [];
          let location = window.location;
          let nextHref = location.origin + location.pathname;

          $.urlParam = function (name) {
              let results = new RegExp('[\?&]' + name + '=([^&#]*)')
                  .exec(window.location.search);

              return (results !== null) ? results[1] || 0 : false;
          }
          if ($.urlParam('limit')) {
              data.push({name: 'limit', value: parseInt($.urlParam('limit'))})
          }

          // Paginate
          const $elPage = JobBoardApp.$jobListing.find('input[name=page]');
          if ($elPage.val()) {
              data.push({name: 'page', value: $elPage.val()});
          }

          data.map(function (obj) {
              if (obj.name === 'offered_salary_to') {
                  obj.value = Number(obj.value.replace(/[^0-9.-]+/g,""));
              }

              if (uriData.find(item => item.includes(obj.name))) {
                  return;
              }

              if (
                  obj.name === 'offered_salary_to'
                  && parseInt($('input[name="offered_salary_to"]').data('default-value')) === parseInt(obj.value)
              ) {
                  return;
              }

              if (obj.name === 'offered_salary_from' && ! parseInt(obj.value)) {
                  return;
              }

              if (obj.name === 'page' && parseInt(obj.value) === 1) {
                  return;
              }

              uriData.push(encodeURIComponent(obj.name) + '=' + obj.value);
          });

          if (uriData && uriData.length) {
              nextHref += `?${uriData.join('&')}`;
          }
          // add to params get to popstate not show json
          data.push({name: '_', value: +new Date()});

          ajaxSending = $.ajax({
              url: $form.attr('action'),
              type: 'GET',
              data: $form.serialize(),
              beforeSend: function () {
                  // Show loading before sending
                  $('#loading').css('display', 'block')
                  $('.job-items').css('opacity', 0.2);
              },
              success: function ({ error, data, additional, message }) {
                  if (error) {
                      showError(message || 'Opp!');

                      return
                  }

                  JobBoardApp.$jobListing.html(data);

                  $form.closest('.filter-section').html($(additional.filters_html).html());

                  initUiSlider($(document).find('#slider-range'))
                  initSelect2($(document).find('#jobs-filter-form .select-location'))

                  if (additional?.message) {
                      JobBoardApp.$jobListing.closest('.jobs-listing-container')
                          .find('.showing-of-results').html(additional.message);
                  }

                  JobBoardApp.executeMap()

                  if (nextHref !== window.location.href) {
                      window.history.pushState(
                          data,
                          message,
                          nextHref
                      );
                  }
              },
              error: function (error) {
                  if (error.statusText === 'abort') {
                      return; // ignore abort
                  }
                  handleError(error);
              },
              complete: function () {
                  setTimeout(function () {
                      $('#loading').css('display', 'none');
                      $('.loading-ring').hide()
                      $('.job-items').css('opacity', 1);
                  }, 500)
              },
          });
      });

      window.addEventListener(
          'popstate',
          function () {
              window.location.reload();
          },
          false
      );

      $(document).on(
          'click',
          JobBoardApp.jobListing + ' .pagination a',
          function (e) {
              e.preventDefault();
              let aLink = $(e.currentTarget).attr('href');

              if (!aLink.includes(window.location.protocol)) {
                  aLink = window.location.protocol + aLink;
              }

              let url = new URL(aLink);
              let page = url.searchParams.get('page');
              JobBoardApp.$jobListing.find('input[name=page]').val(page);
              JobBoardApp.$formSearch.trigger('submit');
          }
      );
  };

  JobBoardApp.jobsFilter();

})(jQuery);