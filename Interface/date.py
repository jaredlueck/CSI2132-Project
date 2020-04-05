   def _get_title(self, cr, uid, ids, field, arg, context=None):
        #Return the reservation title
        
        setting_obj = self.pool.get('booking.config.settings')
        config_ids = setting_obj.search(cr, uid, [], limit=1, order='id DESC', context=context)
        if config_ids:
            booking_title = setting_obj.read(cr, uid, config_ids[0], ['booking_title'], context=context)['booking_title']
        else:
            booking_title = ""
        res = {}
        for reserv in self.browse(cr, uid, ids, context=context):
            res[reserv.id] = booking_title
        return res

    def _date_to_datetime(self, cr, uid, ids, field, arg, context=None):
        #Convert date to datetime (with rules for arrival and departure)
    
        if field == 'arrival_date':
            f, h = operator.attrgetter('arrival_day'), " 16:00:00"
        else:  # departure_date
            f, h = operator.attrgetter('departure_day'), " 10:00:00"

        result = {b.id: f(b) + h for b in self.browse(cr, uid, ids, context=context)}

        return result

    _columns = {
        'name': fields.char(
            'Title',
            size=256,
            required=True,
            select=True,
        ),
        'arrival_day': fields.date(
            string="Arrival day",
            required=True,
        ),
        'arrival_date': fields.function(
            _date_to_datetime,
            type='datetime',
            string="Arrival date",
            store=True,
        ),
        'departure_day': fields.date(
            string="Departure day",
            required=True,
        ),
        'departure_date': fields.function(
            _date_to_datetime,
            type='datetime',
            string="Departure date",
            store=True,
        ),
        'people_number': fields.integer(
            string="Number of People",
        ),
        'state': fields.selection(
            _states,
            string="Booking's state",
        ),
        'price': fields.integer(
            string="Price of booking",
        ),
  
    }

    _order = 'create_date desc'

    _defaults = {
        'state': 'pending',
    }

    _sql_constraints = [
        (
            "house_booking_arrival_before_departure_date_constraint",
            "CHECK(arrival_date < departure_date)",
            "'Arrival date' should be before 'Departure date'",
        ),
        (
            "house_booking_arrival_before_departure_day_constraint",
            "CHECK(arrival_day < departure_day)",
            "'Arrival day' should be before 'Departure day'",
        ),
    ]
