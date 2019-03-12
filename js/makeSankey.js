var sankeyData;
d3.json('js/reportViews.json', function(data, error) {
   if (error) console.log(error);
   sankeyData = data;
});