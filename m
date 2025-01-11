Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FBCA0A526
	for <lists+squashfs-devel@lfdr.de>; Sat, 11 Jan 2025 18:58:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1tWfl1-0005O4-MQ;
	Sat, 11 Jan 2025 17:58:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tWfl0-0005Nr-6y
 for squashfs-devel@lists.sourceforge.net;
 Sat, 11 Jan 2025 17:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gDP2rkKKQtBaLbOL9OpXTvDsGssxcS6T4UgYMd+zd2o=; b=RluCLlaYYxrhTC33GOYJUtZuVw
 vy4oDkJUOld53GVSoPCmB9a/eEsmTATYUrZM+RxQUegh8ujLM9DNVVwjchlR1uQgKPF2L3g6Ot6LU
 bx1loRKFXACGWiJtgCbq5DDiwnV9rpFqr5apW9Wwd2Ii2WE/0VpkIedl9AnwxbWBwmnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gDP2rkKKQtBaLbOL9OpXTvDsGssxcS6T4UgYMd+zd2o=; b=drcNjAF4pYV0KA6v8iPXGqURsa
 Z6PWMqyzww3+r9yPYCRytuA04m50Ra0NE87OEZpzm2jNi5eoqFi0vzXvksK0A4U9Z9Vwo8B6uK0ei
 iJQk9ojM8NYQtdG3Rlvfrt50oXItXhOqfso5hqepE1CH7FN2Zll3JuBWqecsCSK/gQog=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tWfkz-0003c0-3X for squashfs-devel@lists.sourceforge.net;
 Sat, 11 Jan 2025 17:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gDP2rkKKQtBaLbOL9OpXTvDsGssxcS6T4UgYMd+zd2o=; b=TM+5lBWo1bDzyZ620+2CXerYEF
 q1YNTlcpH/RjwUMphuiXxxKlFWoj8weTY5PQFnG6LJex0ExVYy/3mzG4s7mNegq5v8CFJwxBwmsCm
 JzbWNcyry0kNs2HYMe4egUptLt8844dqvwW14QTIwBi7rCN9CY7gg9D6N8Boq20M1HTOFHJJ4goZk
 1dElQZFiB9iubewANMFy65Mr7DGDaRFq4MGEMUa/kv3/gmsjyy/cbLCdRXTwLIYRFyae/a+TsTxJ0
 fQLZvfZP3c3FshahWL97VJ8sRHvg007b31FN3oWh7t0xDK+IQSvvOwK4CqIzdbZcKh2zDw2An6S78
 DNYJlZqg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tWfkn-0000000Fb4e-0Hu9; Sat, 11 Jan 2025 17:58:33 +0000
Date: Sat, 11 Jan 2025 17:58:32 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Message-ID: <Z4KxSBcKpwwr-WF2@casper.infradead.org>
References: <20250110163300.3346321-1-willy@infradead.org>
 <20250110163300.3346321-2-willy@infradead.org>
 <b9ce358d-4f67-48be-94b3-b65a17ef56f9@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9ce358d-4f67-48be-94b3-b65a17ef56f9@arm.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 11, 2025 at 01:21:31PM +0000, Ryan Roberts wrote:
 > On 10/01/2025 16:32, Matthew Wilcox (Oracle) wrote: > > I got the polarity
 of "uptodate" wrong. Rename it. Thanks to > > Ryan for testin [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tWfkz-0003c0-3X
Subject: Re: [Squashfs-devel] [PATCH 2/2] squashfs: Fix "convert
 squashfs_fill_page() to take a folio"
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
Cc: linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 squashfs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Sat, Jan 11, 2025 at 01:21:31PM +0000, Ryan Roberts wrote:
> On 10/01/2025 16:32, Matthew Wilcox (Oracle) wrote:
> > I got the polarity of "uptodate" wrong.  Rename it.  Thanks to
> > Ryan for testing; please fold into above named patch, and he'd like
> > you to add
> > 
> > Tested-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> This is missing the change to folio_end_read() and the change for IS_ERR() that
> was in the version of the patch I tested. Just checking that those were handled
> separately in a thread I'm not CCed on?

https://lore.kernel.org/mm-commits/20250109043130.F38E0C4CED2@smtp.kernel.org/
https://lore.kernel.org/mm-commits/20250110232601.CBE47C4CED6@smtp.kernel.org/

Shouldn't be anything missing; I applied the first one to my tree,
then wrote the second one and the third one you're replying to.  Then
I did a git diff HEAD~3 and sent the result to you to test.

Has anything gone wrong in this process?


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
