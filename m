Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C08A0978D
	for <lists+squashfs-devel@lfdr.de>; Fri, 10 Jan 2025 17:33:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1tWHwl-0005zM-Aq;
	Fri, 10 Jan 2025 16:33:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tWHwi-0005zG-LC
 for squashfs-devel@lists.sourceforge.net;
 Fri, 10 Jan 2025 16:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m6Bun1CPydSCXcEYLw8nRgLr5kgwzReIIu7xc3wV6j0=; b=Q+IM9Ch/RHFfBQKa3GpNwHte66
 mz1SD47IzETNAkV7SBCIEHZzH7eJY4MNOfpjVIYcbyIfulAVAECviNr3AD92ImUSTqUzC2q6cqQlM
 Cfu+++CfDfJlJihlCPFiEXjEeR5Tv1qUiDWsoaOCsV9wapRswNaC+3USPkxxOrFSnOMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=m6Bun1CPydSCXcEYLw8nRgLr5kgwzReIIu7xc3wV6j0=; b=l
 uN5sUrsElx/7n5TzJsT0RHGa8kuM+8gU1WBoTVIZTEFhucKKWKbgJOVCMMbdTlItwPxXW77jEUsLk
 8/HNArs5LPNooiT7j2FkvhYDZfp6cEbc452fUtLLxKi7YH1dpyGwqYt53LH1md+Kqy/gNBk7B4Mkl
 gVYs+Mjl9Mi9NJd8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tWHwg-0005Rm-JO for squashfs-devel@lists.sourceforge.net;
 Fri, 10 Jan 2025 16:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=m6Bun1CPydSCXcEYLw8nRgLr5kgwzReIIu7xc3wV6j0=; b=ePKsIj26Sv78SsRSF/7lp4syKG
 ZA3LIIuT/cPSkx4FB3+pHi+bIxezX5z1oe7nYUuL+7BzRBUd8npUmaLQUweAwji9333wwEKTYhLTk
 3VKjPYbSrY/rNOZCit4u8hlLG4OZle13gAFRwWlSn1vy7DK72m6blWgDpbGBR7yJpCnc6v/bpdV2n
 d5gobM/Vjr1C80uCLWjhM8MLLudSDNic6hXQLhr4CFuSBrx5nGPmEwuvZfVe/cKSpder/1Vvsvixy
 WP6dMAceDOI1oWDtX3E275lX1FBoGSrF0bcUo08CEFPUneYyVNOLO4h9cV9lZskrW7ivf/xKP/VB4
 kW88swlA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tWHwU-0000000E2XG-0rOl; Fri, 10 Jan 2025 16:33:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 10 Jan 2025 16:32:57 +0000
Message-ID: <20250110163300.3346321-1-willy@infradead.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We only need to assert that the uptodate flag is clear if
 we're going to set it. This hasn't been a problem before now because we have
 only used folio_end_read() when completing with an error, but it' [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tWHwg-0005Rm-JO
Subject: [Squashfs-devel] [PATCH 1/2] mm: Fix assertion in folio_end_read()
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 squashfs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

We only need to assert that the uptodate flag is clear if we're going
to set it.  This hasn't been a problem before now because we have only
used folio_end_read() when completing with an error, but it's convenient
to use it in squashfs if we discover the folio is already uptodate.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/filemap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 12ba297bb85e..3b1eefa9aab8 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1505,7 +1505,7 @@ void folio_end_read(struct folio *folio, bool success)
 	/* Must be in bottom byte for x86 to work */
 	BUILD_BUG_ON(PG_uptodate > 7);
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
-	VM_BUG_ON_FOLIO(folio_test_uptodate(folio), folio);
+	VM_BUG_ON_FOLIO(success && folio_test_uptodate(folio), folio);
 
 	if (likely(success))
 		mask |= 1 << PG_uptodate;
-- 
2.45.2



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
