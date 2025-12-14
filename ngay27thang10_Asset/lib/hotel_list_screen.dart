import 'package:flutter/material.dart';

class BookingListPage extends StatelessWidget {
  const BookingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: myBody()),
    );
  }

  Widget myBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _TopBar(),
          _ActionBar(),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              '757 chỗ nghỉ',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ),
          _CardANhill(),
          _CardAnNam(),
          _CardHueJade(),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}


class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(color: const Color(0xFFE7E7E7), width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Colors.black87,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Xung quanh vị trí hiện tại',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '23 thg 10 – 24 thg 10',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar();

  @override
  Widget build(BuildContext context) {
    Widget item(IconData i, String t) => Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(i, size: 18, color: Colors.black87),
          const SizedBox(width: 6),
          Text(
            t,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          item(Icons.swap_vert, 'Sắp xếp'),
          const SizedBox(
            width: 1,
            height: 22,
            child: ColoredBox(color: Color(0xFFD9D9D9)),
          ),
          item(Icons.tune, 'Lọc'),
          const SizedBox(
            width: 1,
            height: 22,
            child: ColoredBox(color: Color(0xFFD9D9D9)),
          ),
          item(Icons.map_outlined, 'Bản đồ'),
        ],
      ),
    );
  }
}


class _CardANhill extends StatelessWidget {
  const _CardANhill();

  @override
  Widget build(BuildContext context) {
    return _CardStandard(
      imagePath: 'assets/placepng/anhill-boutique.png',
      hasBreakfast: true,
      name: 'aNhill Boutique',
      showStars: true,
      stars: 5,
      score: '9,5',
      scoreLabel: 'Xuất sắc',
      review: '95 đánh giá',
      city: 'Huế',
      distance: '0,6km',
      roomSummary: '1 suite riêng tư · 1 giường',
      price: 'US\$109',
      greenNote: 'Không cần thanh toán trước',
    );
  }
}


class _CardAnNam extends StatelessWidget {
  const _CardAnNam();

  @override
  Widget build(BuildContext context) {
    return _CardStandard(
      imagePath: 'assets/placepng/An-nam-Hue.png',
      hasBreakfast: true,
      name: 'An Nam Hue Boutique',
      showStars: true,
      stars: 0,
      score: '9,2',
      scoreLabel: 'Tuyệt hảo',
      review: '34 đánh giá',
      city: 'Cư Chính',
      distance: '0,9km',
      roomSummary: '1 phòng khách sạn · 1 giường',
      price: 'US\$20',
    );
  }
}


class _CardHueJade extends StatelessWidget {
  const _CardHueJade();

  @override
  Widget build(BuildContext context) {
    return _CardStandard(
      imagePath: 'assets/placepng/hue-jade.png',
      hasBreakfast: false,
      name: 'Huế Jade Hill Villa',
      showStars: true,
      stars: 0,
      score: '8,0',
      scoreLabel: 'Rất tốt',
      review: '1 đánh giá',
      city: 'Cư Chính',
      distance: '1,3km',
      roomSummary:
          '1 biệt thự nguyên căn – 1.000 m² · 4 giường · 3 phòng ngủ · 1 phòng khách · 3 phòng tắm',
      price: 'US\$285',
      redNote: 'Chỉ còn 1 căn với giá này trên Booking.com',
      greenNote: 'Không cần thanh toán trước',
    );
  }
}

/// ======================= TEMPLATE CARD: Layout ngang ảnh trái - text phải =======================
class _CardStandard extends StatelessWidget {
  const _CardStandard({
    required this.imagePath,
    required this.hasBreakfast,
    required this.name,
    required this.showStars,
    required this.stars,
    required this.score,
    required this.scoreLabel,
    required this.review,
    required this.city,
    required this.distance,
    required this.roomSummary,
    required this.price,
    this.redNote,
    this.greenNote,
  });

  final String imagePath;
  final bool hasBreakfast;
  final String name;
  final bool showStars;
  final int stars;
  final String score, scoreLabel, review, city, distance, roomSummary, price;
  final String? redNote, greenNote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              _hotelImage(imagePath),
              if (hasBreakfast) const _BreakfastBadge(),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.favorite_border,
                      size: 22,
                      color: Colors.black54,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    if (showStars) ...[
                      Row(
                        children: List.generate(
                          stars,
                          (_) => const Icon(
                            Icons.star,
                            size: 14,
                            color: Color(0xFFFFB400),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                    ],
                    _scoreBox(score),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '$scoreLabel · $review',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '$city · Cách bạn $distance',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  roomSummary,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Đã bao gồm thuế và phí',
                  style: TextStyle(fontSize: 11, color: Colors.black54),
                ),

                if (redNote != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    redNote!,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFD32F2F),
                    ),
                  ),
                ],

                if (greenNote != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        size: 14,
                        color: Color(0xFF0A7D2B),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          greenNote!,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF0A7D2B),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
Widget _hotelImage(String path) => SizedBox(
  width: 120,
  height: 96,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.asset(
      path,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey.shade300,
          alignment: Alignment.center,
          child: const Icon(Icons.image_not_supported),
        );
      },
    ),
  ),
);

Widget _scoreBox(String txt) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  decoration: BoxDecoration(
    color: const Color(0xFF003580),
    borderRadius: BorderRadius.circular(4),
  ),
  child: Text(
    txt,
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 12,
    ),
  ),
);

class _BreakfastBadge extends StatelessWidget {
  const _BreakfastBadge();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: const BoxDecoration(
          color: Color(0xFF0B7E51),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: const Text(
          'Bao bữa sáng',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
