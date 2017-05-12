$(document).ready(function() {
  $('.select-job').on('change', function() {
    var job_id = $(this).val(),
      company_id = $('#company-id').val();

    $.ajax({
      dataType: 'html',
      url: '/employer/companies/' + company_id + '/candidates',
      method: 'get',
      data: {select: job_id},
      success: function(data) {
        $('#list-candidates').html(data);
      },
      error: function() {
        alert(I18n.t('employer.candidates.not_found'));
      }
    });
  });

  $('#checkbox0').change(function() {
    var checkboxes = $(this).parents('table')
      .find('tbody input[type = "checkbox"]');
    if($(this).is(':checked')) {
      checkboxes.prop('checked', true);
    } else {
      checkboxes.prop('checked', false);
    }
  });

  $('.button-direct .btn-cancel').click(function(){
    if ($('.btn-filter').hasClass('open')) {
      $('.btn-filter').removeClass('open');
    }
  });

  $('.btn-filter').each(function(){
    if ($(this).parent().position().left > 600) {
      $(this).children().eq(1).css('left','-232px');
    }
  });

  $('.filter .checkall').click(function() {
    var checkboxes = $(this).parent().siblings('.list-item-value').children().children('input[type = "checkbox"]');
    checkboxes.prop('checked', true);
  });

  $('.filter .delete').click(function() {
    var checkboxes = $(this).parent().siblings('.list-item-value').children().children('input[type = "checkbox"]');
    checkboxes.prop('checked', false);
  });

  $('.dropdown-toggle').dropdown();

  $('.sortAlpha, .btn-ok').click(function(){
    var typefilter = $(this).parents().eq(2).attr('data-filter'),
      sortBy = $(this).attr('data-sort-by'),
      listcheckbox = $(this).parents('ul').children().find('.checkboxitem'),
      arrchecked = [],
      company_id = $('#company-id').val(),
      filter_mode = $(this).parents().eq(2).attr('data-model');

    listcheckbox.each(function(){
      if ($(this).is(':checked')) {
        arrchecked.push($(this).attr('data-list-id'));
      }
    });

    var params = {type: typefilter, sort: sortBy, array_id: arrchecked},
      url = '',
      tbody = '';

    switch (filter_mode) {
      case 'candidate':
      url_request = '/employer/companies/' + company_id + '/candidates';
      tbody = $('#list-candidates');
      break;

      case 'job':
      url_request = '/employer/companies/' + company_id + '/jobs';
      tbody = $('.jobs-list');
      break;
    }

    $.ajax({
      dataType: 'json',
      url: url_request,
      method: 'GET',
      data: params,
      success: function(data) {
        tbody.html(data.html_job);
        if (filter_mode === 'job') {
          $('.pagination-job').html(data.pagination_job);
        }
        if ($('.btn-filter').hasClass('open')) {
          $('.btn-filter').removeClass('open');
        }
      },
    });

  });

  $('.search-user-filter').keyup(function(){
    var value = $(this).val(),
      object_checkbox = $(this).parents('.value-sort')
        .children('.list-item-value').find('.checkbox');
    if (value == '') {
      object_checkbox.show();
    }
    else {
      object_checkbox.each(function(){
        if ($(this).children('label').html().toLowerCase().search(value.toLowerCase()) >= 0) {
          $(this).show();
        }else {
          $(this).hide();
          $(this).children('input').attr('checked', false);
        }
      });
    }
  });
});

$(document).on('click.my', '.filter', function(e) {
  e.stopPropagation();
});
